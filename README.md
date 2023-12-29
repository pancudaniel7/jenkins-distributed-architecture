#Example-2

The projects focuses on higlighting best practices for Terraform projects when the desgin needs multiple regions and environments, 
the project uses Terraform workspaces for isolating environment infrastructure code.

# RUN

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
terraform apply -auto-approve -var-file=dev.tfvars
terraform destroy -auto-approve -var-file=dev.tfvars
```

