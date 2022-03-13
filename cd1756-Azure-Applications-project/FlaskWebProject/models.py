from datetime import datetime
from FlaskWebProject import app, db, login
from werkzeug.security import generate_password_hash, check_password_hash
from flask_login import UserMixin
from azure.storage.blob import BlockBlobService
import string, random
from werkzeug import secure_filename
from flask import flash
import logging

blob_container = app.config['BLOB_CONTAINER']
blob_service = BlockBlobService(account_name=app.config['BLOB_ACCOUNT'], account_key=app.config['BLOB_STORAGE_KEY'])

def id_generator(size=32, chars=string.ascii_uppercase + string.digits):
    return ''.join(random.choice(chars) for _ in range(size))

class User(UserMixin, db.Model):
    __tablename__ = 'users'
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(64), index=True, unique=True)
    password_hash = db.Column(db.String(128))

    def __repr__(self):
        return '<User {}>'.format(self.username)

    def set_password(self, password):
        self.password_hash = generate_password_hash(password)

    def check_password(self, password):
        return check_password_hash(self.password_hash, password)

@login.user_loader
def load_user(id):
    return User.query.get(int(id))

class Post(db.Model):
    __tablename__ = 'posts'
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(150))
    subtitle = db.Column(db.String(150))
    author = db.Column(db.String(75))
    body = db.Column(db.String(800))
    image_path = db.Column(db.String(100))
    timestamp = db.Column(db.DateTime, index=True, default=datetime.utcnow)
    user_id = db.Column(db.Integer, db.ForeignKey('users.id'))
    

    def __repr__(self):
        logging.info(f'IN __repr__')
        return '<Post {}>'.format(self.body)

    def delete_post(self, id):
        logging.info(f'DELETE blob {self.id}')
        #print(f'DELETE blob {self.id}')
        # blob_service.delete_blob(blob_container, self.id)
        obj = Post.query.filter_by(id=id).one()
        db.session.delete(obj)
        db.session.commit()

    def save_changes(self, form, file, userId, new=False):
        try:
            self.title = form.title.data
            self.subtitle = form.subtitle.data
            self.author = form.author.data
            self.body = form.body.data
            self.user_id = userId

            #print(f'COLUMN {self.id} (id)')
            #print(f'COLUMN {self.title} (title)')
            #print(f'COLUMN {self.subtitle} (subtitle)')
            #print(f'COLUMN {self.author} (author)')
            #print(f'COLUMN {self.body} (body)')
            #print(f'COLUMN {self.image_path} (image_path)')

            logging.info(f'COLUMN {self.id} (id)')
            logging.info(f'COLUMN {self.title} (title)')
            logging.info(f'COLUMN {self.subtitle} (subtitle)')
            logging.info(f'COLUMN {self.author} (author)')
            logging.info(f'COLUMN {self.body} (body)')
            logging.info(f'COLUMN {self.image_path} (image_path)')


            #print(f'SAVING {file.filename}')
            logging.info(f'SAVING {file.filename}')
            if file.filename:
                filename = secure_filename(file.filename);
                fileextension = filename.rsplit('.',1)[1];
                Randomfilename = id_generator();
                filename = Randomfilename + '.' + fileextension;
                
                #print(f'CREATING NEW FILENAME {filename}')
                logging.info(f'CREATING NEW FILENAME {filename}')
                
                blob_container_name = app.config['BLOB_CONTAINER']
                blob_account = app.config['BLOB_ACCOUNT']
                blob_storage_key = app.config['BLOB_STORAGE_KEY']
                #print(f'issue with container {blob_container_name} account {blob_account} and key {blob_storage_key}')
                logging.info(f'issue with container {blob_container_name} account {blob_account} and key {blob_storage_key}')
            
                blob_service = BlockBlobService(account_name=app.config['BLOB_ACCOUNT'], account_key=app.config['BLOB_STORAGE_KEY'])
                blob_service.create_blob_from_stream(blob_container, filename, file)
                if(self.image_path):
                    blob_service.delete_blob(blob_container, self.image_path)                
                self.image_path =  filename
            if new:
                db.session.add(self)
            db.session.commit()
        except Exception:
                flash(Exception)
