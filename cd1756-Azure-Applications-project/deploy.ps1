$SUBSCRIPTION = "CC-AD-ESW-Sandbox"
$LOCATION = "swedencentral"
$RESOURCE_GROUP = "resource-group-cd1756"
# Write-Host "----> Creating a resource group $RESOURCE_GROUP"
# az group create --subscription $SUBSCRIPTION --location $LOCATION --name $RESOURCE_GROUP



$SQL_SERVER = "cd1756-server"
# $ADMIN_USER = "cd1756admin"
# $ADMIN_PWD = "Flipsine123"
# Write-Host "----> Creating a SQL server $SQL_SERVER"
# az sql server create --subscription $SUBSCRIPTION --admin-user $ADMIN_USER --admin-password $ADMIN_PWD --name $SQL_SERVER --resource-group $RESOURCE_GROUP --location $LOCATION --enable-public-network true --verbose

# $START = "0.0.0.0"
# $END = "0.0.0.0"
# Write-Host "----> Setting firewall rule for ip from $START to $END"
# az sql server firewall-rule create -g $RESOURCE_GROUP -s $SQL_SERVER -n azureaccess --start-ip-address $START --end-ip-address $END --verbose




$SQL_DATABASE = "cd1756database"
# Write-Host "----> Creating a SQL database $SQL_DATABASE"
# az sql db create --name $SQL_DATABASE --resource-group $RESOURCE_GROUP --server $SQL_SERVER --tier Basic --verbose

# $SCRIPT = "C:\NoneDrive\Projects\GitHub\azure_samples\cd1756-Azure-Applications-project\sql_scripts\users-table-init.sql"
# # Write-Host "----> Executing script in SQL database $SCRIPT"
# # az sql execute -n $SQL_SERVER -u $ADMIN_USER -p $ADMIN_PWD -d $SQL_DATABASE --file-path $SCRIPT

$STORAGE_ACCOUNT = "cd1756storage"
# $STORAGE_ACCOUNT_KEY = "OGfFfY0HAKSelHkdI7Mbv1Hq6VPaZYaO9TW8f0YERpmqLLo+K8zMoBLRyLMyD33LOWzpm4yhJjT4U8xBmuzUuQ=="
# Write-Host "----> Creating storage account $STORAGE_ACCOUNT"
# az storage account create --subscription $SUBSCRIPTION --name $STORAGE_ACCOUNT --location $LOCATION --resource-group $RESOURCE_GROUP

$STORAGE_ACCOUNT_KEYS = az storage account keys list --account-name $STORAGE_ACCOUNT
$LENGTH = $STORAGE_ACCOUNT_KEYS.length
# Write-Host "----> List of account keys found $STORAGE_ACCOUNT_KEYS with length $LENGTH"

$STORAGE_ACCOUNT_KEY_VALUE = $STORAGE_ACCOUNT_KEYS[11]
$STORAGE_ACCOUNT_KEY = $STORAGE_ACCOUNT_KEY_VALUE.Substring(14, 88)


# $CONTAINER = "images"
# Write-Host "----> Creating container in storage account $CONTAINER with account key $STORAGE_ACCOUNT_KEY"
# az storage container create --subscription $SUBSCRIPTION --name $CONTAINER --resource-group $RESOURCE_GROUP --account-name $STORAGE_ACCOUNT --account-key $STORAGE_ACCOUNT_KEY

# $WEBAPP_NAME = "cd1756application"
# Write-Host "----> Creating web app $WEBAPP_NAME"
# az webapp up --resource-group $RESOURCE_GROUP --name $WEBAPP_NAME --sku F1 --verbose

# $START = "217.236.237.231"
# $END = "217.236.237.231"
# Write-Host "----> Setting firewall rule for ip from $START to $END"
# az sql server firewall-rule create -g $RESOURCE_GROUP -s $SQL_SERVER -n azureaccess --start-ip-address $START --end-ip-address $END --verbose


# $START = "52.153.125.122"
# $END = "52.153.125.122"
# Write-Host "----> Setting firewall rule for ip from $START to $END"
# az sql server firewall-rule create -g $RESOURCE_GROUP -s $SQL_SERVER -n azureaccess --start-ip-address $START --end-ip-address $END --verbose


# $START = "52.153.125.216"
# $END = "52.153.125.216"
# Write-Host "----> Setting firewall rule for ip from $START to $END"
# az sql server firewall-rule create -g $RESOURCE_GROUP -s $SQL_SERVER -n azureaccess --start-ip-address $START --end-ip-address $END --verbose

$START = "20.118.64.108"
$END = "20.118.64.108"
Write-Host "----> Setting firewall rule for ip from $START to $END"
az sql server firewall-rule create -g $RESOURCE_GROUP -s $SQL_SERVER -n azureaccess --start-ip-address $START --end-ip-address $END --verbose

# $START = "217.sall-rule create -g $RESOURCE_GROUP -s $SQL_SERVER -n azureaccess --start-ip-address $START --end-ip-address $END --verbose

# $START = "217.236.227.117"
# $END = "217.236.227.117"
# Write-Host "----> Setting firewall rule for ip from $START to $END"
# az sql server firewall-rule create -g $RESOURCE_GROUP -s $SQL_SERVER -n azureaccess --start-ip-address $START --end-ip-address $END --verbose


# $DISPLAY_NAME = "cd1756registration"
# Write-Host "----> Register app service with display name $DISPLAY_NAME"
# $MESSAGE = az ad app create --display-name $DISPLAY_NAME
# # Write-Host "----> Registerered $MESSAGE"
# $APP_ID_KEY_VALUE = $MESSAGE[5]
# Write-Host "----> App Id  $APP_ID_KEY_VALUE"
# $APP_ID = $APP_ID_KEY_VALUE.Substring(12, 36)
# Write-Host "----> App Id  $APP_ID"

# $CREDENT_DESC = "cd1756"
# Write-Host "----> Creating secret for $APP_ID"
# $SECRET = az ad app credential reset --id $APP_ID --credential-description $CREDENT_DESC
# Write-Host "----> Secret  $SECRET"

# Write-Host "----> Getting the secret for $APP_ID"
# $CRED_LIST = az ad app credential list --id $APP_ID
# $CRED_LIST_KEY_VALUE = $CRED_LIST[5]
# Write-Host "----> CRED LIST $CRED_LIST_KEY_VALUE"
# $KEY_ID = $CRED_LIST_KEY_VALUE.Substring(14, 36)
# Write-Host "----> Key Id  $KEY_ID"

# $AZ_APP_LIST = az ad app list --display-name $DISPLAY_NAME
# Write-Host "----> Active Directory registered applications $AZ_APP_LIST"



# Deleting
# Write-Host "----> Deleting a SQL database $SQL_DATABASE"
# az sql db delete --name $SQL_DATABASE --resource-group $RESOURCE_GROUP --server $SQL_SERVER --verbose

# Write-Host "----> Deleting a resource group $RESOURCE_GROUP"
# az group delete --subscription $SUBSCRIPTION --name $RESOURCE_GROUP

# Write-Host "----> Deleting a app service plan $APP_SERVICE_PLAN"
# az appservice plan delete --subscription $SUBSCRIPTION2  --name $APP_SERVICE_PLAN --resource-group $RESOURCE_GROUP2 

# Write-Host "----> Deleting storage account $STORAGE_ACCOUNT2"
# az storage account delete --subscription $SUBSCRIPTION1 --name $STORAGE_ACCOUNT2 --resource-group $RESOURCE_GROUP3