
##############################################
### Login to Azure and select subscription ###
##############################################

# Login to Azure
Login-AzureRmAccount

# Select Azure subscription - Get-AzureRmSubscription lists subscriptions
Select-AzureRmSubscription -SubscriptionName '<SUBSCRIPTION-NAME>'



############################################
### Create Azure SQL Database and Server ###
############################################

$sqlServerLocation = 'West Europe'
$sqlServerName = '<SERVERNAME>'           #<SERVERNAME>.database.windows.net
$sqlServerAdmin = '<USERNAME>'
$sqlServerPassword = '<PASSWORD>'
$sqlServerVersion = '12.0'
$sqlServerDatabaseName = '<DBNAME>'
$sqlServerDatabaseEdition = 'Standard'
$sqlServerDatabaseLevel = 'S1'
$SqlServerDatabaseCollation = 'Latin1_General_CI_AS'

# Convert credentials 
$securePassword = ConvertTo-SecureString –String $sqlServerPassword –AsPlainText -Force
$credentials = New-Object –TypeName System.Management.Automation.PSCredential –ArgumentList $sqlServerAdmin, $securePassword

# Create Ressource Group
$azrRessourceGroup = New-AzureRmResourceGroup -Name "$sqlServerName-rg" -Location $sqlServerLocation

# Create Azure SQL Server, open firewall and create database
$azrSqlSrv = New-AzureRmSqlServer -ServerName $sqlServerName -Location $sqlServerLocation -SqlAdministratorCredentials $credentials -ResourceGroupName $azrRessourceGroup.ResourceGroupName -ServerVersion $sqlServerVersion
$azrSqlSrvFwRule = New-AzureRmSqlServerFirewallRule -ResourceGroupName $azrRessourceGroup.ResourceGroupName -ServerName $azrsqlsrv.ServerName -FirewallRuleName 'Any' -StartIpAddress '0.0.0.0' -EndIpAddress '255.255.255.255'
$azrSqlDb = New-AzureRmSqlDatabase -ResourceGroupName $azrRessourceGroup.ResourceGroupName -ServerName $azrSqlSrv.ServerName -DatabaseName $sqlServerDatabaseName -Edition $sqlServerDatabaseEdition -RequestedServiceObjectiveName $sqlServerDatabaseLevel -CollationName $SqlServerDatabaseCollation



############################
### Clean up the kitchen ###
############################
Remove-AzureRmResourceGroup -Name $azrRessourceGroup.ResourceGroupName -Force
