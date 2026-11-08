@'
# Azure DevOps Portfolio

Three connected projects that deploy a two-tier Azure environment.

## Projects
1. **ARM multi-tier template** (`arm-multitier/`): App Service plan, web app, and Azure SQL database.
2. **CLI automation scripts** (`cli-scripts/`): PowerShell scripts that create the resource group, deploy the template, and clean up.
3. **Azure DevOps pipeline** (`pipeline/`): YAML pipeline with a Validate stage and a Deploy stage, using a service connection and a secret variable for the SQL password.

## How to run
```powershell
az login
$env:SQL_PASSWORD = '<your-password>'
cd cli-scripts
.\deploy.ps1 -Location westus3
```

## Pipeline result
![Pipeline run](docs/pipeline-green.png)

## What I learned
- Deploying infrastructure as code with ARM templates
- Handling region and quota limits on a new subscription
- Keeping secrets out of the repo with secret pipeline variables
'@ | Set-Content README.md
