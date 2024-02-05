#Example-2

The projects focuses on higlighting best practices for Terraform projects when the desgin needs multiple regions and environments, 
the project uses Terraform workspaces for isolating environment infrastructure code.

# RUN

Env variables: 
```bash
export TF_VAR_ssh_public_key_path=/Users/pancudaniel/.ssh; \
export TF_VAR_ssh_key_name=jenkins_infra # This is also the default value in the code
```

Basics Terraform workspaces commands:
```sh
terraform workspace new [env-name]
terraform workspace list
terraform workspace select [env-name]
```
Main Terraform commands for checking,deploying and destroying infrastructure:
```sh
terraform init
terraform validate
terraform plan
terraform apply -auto-approve -var-file=dev.tfvars -lock=false
terraform destroy -auto-approve -var-file=dev.tfvars -lock=false
```

