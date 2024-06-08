
# Infrastructure Deployment

This directory contains the Terraform configuration for deploying the infrastructure across multiple regions and environments. The design leverages Terraform workspaces for isolating environment-specific infrastructure code.

## Overview

The project focuses on highlighting best practices for Terraform projects when the design needs multiple regions and environments. It uses Terraform workspaces to manage distinct sets of infrastructure resources for each environment such as development, staging, and production.

## Setting Up Environment Variables

Before running Terraform commands, set up the following environment variables for SSH key configuration:

```bash
export TF_VAR_ssh_public_key_path=<path_to_ssh_public_key>
export TF_VAR_ssh_key_name=jenkins_infra  # Default value, can be changed as needed
```

Replace `<path_to_ssh_public_key>` with the actual path to your SSH public key.

## Using Terraform Workspaces

Terraform workspaces are used to manage different environments within the same Terraform configuration. The following commands help in managing these workspaces:

```sh
terraform workspace new [env-name]     # Create a new workspace
terraform workspace list               # List all available workspaces
terraform workspace select [env-name]  # Switch to an existing workspace
```

Replace `[env-name]` with the name of your environment, like `dev`, `stage`, or `prod`.

## Main Terraform Commands

Execute the following Terraform commands to manage your infrastructure:

1. **Initialize Terraform**:
   Initialize the Terraform working directory and download required plugins.
   ```bash
   terraform init
   ```

2. **Validate Terraform Configuration**:
   Check the configuration for errors.
   ```bash
   terraform validate
   ```

3. **Plan Infrastructure Changes**:
   Preview the changes Terraform plans to make to your infrastructure.
   ```bash
   terraform plan -var-file=[env].tfvars
   ```

4. **Apply Infrastructure Changes**:
   Apply the planned changes to your infrastructure.
   ```bash
   terraform apply -auto-approve -var-file=[env].tfvars -lock=false
   ```

5. **Destroy Infrastructure**:
   Tear down the infrastructure managed by Terraform.
   ```bash
   terraform destroy -auto-approve -var-file=[env].tfvars -lock=false
   ```

Replace `[env].tfvars` with the variable file for your specific environment (e.g., `dev.tfvars`, `stage.tfvars`).

## Best Practices

- Always test infrastructure changes in a non-production environment before applying them to production.
- Regularly back up your Terraform state files, especially when managing critical infrastructure.
- Review and validate changes carefully before applying them, to avoid unintended disruptions.

## Note

This README provides guidelines and best practices for managing infrastructure with Terraform, particularly for complex setups involving multiple environments and regions. Adjust the steps and commands according to your project's specific requirements and infrastructure.

---
For provisioning setup details, see [Provisioning](../provisioning/README.md).