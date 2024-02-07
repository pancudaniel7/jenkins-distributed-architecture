
# Provisioning

This directory contains the Ansible playbooks and roles for provisioning the infrastructure. It is designed to set up and configure the necessary components, including Jenkins master and worker nodes.

## Overview

Provisioning with Ansible automates the setup of the entire infrastructure, ensuring consistency and efficiency. It includes the configuration of Jenkins nodes and other necessary services across your infrastructure.

## Running the Ansible Playbook

To provision your infrastructure with Ansible, execute the following commands:

1. **List Ansible Inventory**:
   Review the current Ansible inventory derived from AWS EC2.
   ```bash
   ansible-inventory -i inventory/inventory_aws_ec2.yml --list
   ```

2. **Execute the Playbook**:
   Run the Ansible playbook to start the provisioning process.
   ```bash
   ansible-playbook -i inventory/inventory_aws_ec2.yml playbooks/site.yml
   ```

## Jenkins Configuration

### Post-Provisioning Details

After the provisioning process with Ansible, your Jenkins master and worker nodes will be set up. You can find the initial admin password for Jenkins on the master node in the `/var/lib/jenkins/secrets/initialAdminPassword` file. Additionally, this password, along with the public IP addresses of the Jenkins master and worker nodes, will be displayed in the output of the Ansible playbook run.

### Accessing Jenkins Nodes

Use the public IP addresses displayed in the Ansible playbook output to access the Jenkins web interface and configure node communications. These IP addresses provide direct access to the Jenkins nodes for initial setup and further configuration tasks


## Post-Setup Steps

Once Jenkins is up and running, you can:

- Configure Jenkins nodes and plugins as required.
- Set up your CI/CD pipelines.
- Integrate with other tools and services.

---

For infrastructure setup details, see [Infrastructure README](../infrastructure/README.md).
