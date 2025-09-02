# 🚧 Terraform Manager Project Template DRAFT
⚠️ **This project blueprint is a DRAFT and simplified example only!** ⚠️

💡 This project blueprint can be used to demonstrate how to manage a multi-module Terraform project seamlessly within the Console. This is the overall architecture of the solution.

![Terraform-Multi-Module](images/Terraform-Multi-Module.drawio.png)

 - The provided pipeline has been tested only on a **specific use case** and may have hardcoded references and names.

 📚 **Use this as a learning reference, not for production deployments**

## Pipeline Variables

The Azure DevOps pipeline requires the following variables to be replaced before execution.

| Variable | Description | Example |
|----------|-------------|---------|
| `VARIABLES_GROUP_NAME` | The name of the Azure DevOps variable group containing environment secrets and configuration | `terraform-manager-dev-vars` |
| `DEVOPS_TRIGGER_USER` | The Azure DevOps username or service account used to trigger the pipeline | `myuser@domain.com` |
| `DEVOPS_TRIGGER_PRIVATE_ACCESS_TOKEN` | The Azure DevOps Personal Access Token (PAT) for authentication | `abcdef1234567890` |
