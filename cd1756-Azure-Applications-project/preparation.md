in git bash
choco install openssl

 pip install -r .\requirements.txt

In Powershell:
python -m venv .\venv
.\venv\Scripts\activate
pip install -r .\requirements.txt

 gci env:* | sort-object name
 $env:INCLUDE='C:\Program Files\OpenSSL-win64\include;'+$env:INCLUDE
 $env:LIB='C:\Program Files\OpenSSL-win64\lib;' + $env:LIB

 cffi does not compile with python 3.10 -> goes back to 3.9.9
 egg_info does not compile -> go back to 3.8

C:\Users\claudia\AppData\Local\Programs\Python\Python38-32\python.exe -m pip install -r .\requirements.txt
C:\Users\claudia\AppData\Local\Programs\Python\Python38-32\python.exe application.py