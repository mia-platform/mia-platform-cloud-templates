# 🚧 Azure WebApp Project Template DRAFT
⚠️ **This project blueprint is a DRAFT and simplified example only!** ⚠️
 - The provided pipeline contains hardcoded `templateDirectory` assuming only `DEV` environment exists.
 - The provided pipeline has been tested only on a **specific use case** and has hardcoded references and names (e.g. `currentAppName`).

 📚 **Use this as a learning reference, not for production deployments**

## Pipeline Variables

The Azure DevOps pipeline requires the following variables to be replaced before execution.

| Variable | Description | Example |
|----------|-------------|---------|
| `{{AZURE_SUBSCRIPTION}}` | The name of the Azure service connection configured in Azure DevOps | `MyAzureSubscription` |
| `{{AZURE_SUBSCRIPTION_ID}}` | The Azure subscription ID where resources will be deployed | `12345678-1234-1234-1234-123456789012` |
| `{{AZURE_RESOURCE_GROUP_NAME}}` | The name of the Azure resource group where resources will be deployed | `my-app-rg` |
| `{{AZURE_LOCATION}}` | The Azure region where resources will be deployed | `eastus` |
| `{{AZURE_PACKAGE_FEED_NAME}}` | The name of the Azure Artifacts feed containing the deployment packages | `my-package-feed` |
