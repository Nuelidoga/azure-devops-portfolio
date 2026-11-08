param(
  [string]$Location = "northeurope"
)

$RG = "rg-multitier-demo"

Write-Host "Creating resource group in $Location..."
az group create --name $RG --location $Location

Write-Host "Deploying ARM template..."
az deployment group create `
  --name multitier `
  --resource-group $RG `
  --template-file ..\arm-multitier\azuredeploy.json `
  --parameters sqlAdminUser=sqladmin sqlAdminPassword=$env:SQL_PASSWORD

if ($LASTEXITCODE -eq 0) {
  Write-Host "Done. Web app URL:"
  az deployment group show -g $RG -n multitier --query properties.outputs.webAppUrl.value -o tsv
} else {
  Write-Host "Deployment failed in $Location. Delete the group and try another region."
}
