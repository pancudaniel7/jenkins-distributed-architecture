# Contributing to Jenkins Distributed Architecture

Thanks for your interest in contributing! This project is licensed under the
Apache License, Version 2.0. By contributing, you agree that your contributions
will be licensed under Apache-2.0.

## Ways to Contribute

- Report bugs and request features via GitHub Issues
- Improve documentation and examples
- Submit pull requests for fixes and enhancements

## Development Prerequisites

- Terraform >= 1.3
- AWS account and credentials (e.g., an AWS CLI profile used by Terraform)
- Ansible >= 2.12
- Optional: `ansible-lint` for best-practice linting

## Getting Started

This repository provisions a Jenkins controller/agent architecture using
Terraform (in `deployment/`) and Ansible (in `provisioning/`). See detailed
instructions in those directories’ READMEs.

### Terraform workflow (summary)

From `deployment/`:

```sh
terraform init
terraform workspace new dev   # or select an existing workspace
terraform validate
terraform plan -var-file=dev.tfvars
terraform apply -var-file=dev.tfvars
```

Tips:
- Format code: `terraform fmt -recursive`
- Validate modules: `terraform validate`
- Use separate workspaces and `*.tfvars` per environment

### Ansible workflow (summary)

From `provisioning/`:

```sh
ansible-inventory -i inventory/inventory_aws_ec2.yml --list
ansible-playbook -i inventory/inventory_aws_ec2.yml playbooks/site.yml -e "jenkins_password=<your_password>"
```

Tips:
- Ensure your SSH key matches the one provisioned by Terraform
- Lint playbooks: `ansible-lint` (if installed)

## Pull Requests

- Create a feature branch based off `main`
- Keep changes focused and cohesive
- Update docs when behavior or workflows change
- Ensure `terraform fmt -recursive` passes
- Ensure playbooks remain idempotent

### Commit Message Guidance

Use clear, descriptive commit messages. Conventional Commits are welcome but
not required. Example:

```
feat(provisioning): add node registration role for agents
fix(terraform): correct security group egress rule
docs: improve deployment README with workspace examples
```

## Code Style & Licensing

- Prefer adding SPDX headers to source files:
  - `# SPDX-License-Identifier: Apache-2.0` for `.tf`, `.yml`, `.sh`, etc.
- Include meaningful comments and keep modules/playbooks readable and modular.

## Reporting Security Issues

Please do not file public issues for vulnerabilities. See SECURITY.md for our
responsible disclosure process.

