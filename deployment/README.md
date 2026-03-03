
# Jenkins Deployment

This directory contains the Ansible playbooks and roles for deploying and configuring Jenkins on the provisioned infrastructure. It sets up the necessary components, including Jenkins controller and worker nodes.

## Overview

Deployment with Ansible automates the rollout of Jenkins, ensuring consistency and efficiency. It includes the configuration of Jenkins nodes and other necessary services across your infrastructure.

## Running the Ansible Playbook

To deploy Jenkins with Ansible, execute the following commands:

1. **List Ansible Inventory**:
   Review the current Ansible inventory derived from AWS EC2.
   ```bash
   ansible-inventory -i inventory/inventory_aws_ec2.yml --list
   ```

2. **Execute the Playbook**:
   Run the Ansible playbook to start the deployment process.
   ```bash
   ansible-playbook -i inventory/inventory_aws_ec2.yml playbooks/site.yml -e "jenkins_password=asdasdiytagsdjh123"
   ```

## Jenkins Configuration

### Accessing Jenkins Nodes

Use the public IP addresses displayed in the Ansible playbook output to access the Jenkins web interface and configure node communications. These IP addresses provide direct access to the Jenkins nodes for initial setup and further configuration tasks


## Post-Setup Steps

Once Jenkins is up and running, you can:

- Configure Jenkins nodes and plugins as required.
- Set up your CI/CD pipelines.
- Integrate with other tools and services.

---

For infrastructure provisioning details, see [Provisioning](../provisioning/README.md).
