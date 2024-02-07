
# Jenkins Distributed Architecture Project

## Overview

This project sets up a Jenkins distributed architecture using Terraform for infrastructure management and Ansible for provisioning. The setup includes a Jenkins master node and several slave nodes to efficiently manage and scale CI/CD tasks.

## Setting Up the Infrastructure

Follow the steps in [Infrastructure](./infrastructure/README.md) to set up the infrastructure using Terraform.

## Provisioning with Ansible

After setting up the infrastructure, provision the servers using the steps described in [Provisioning](./provisioning/README.md).

## Master-Slave Configuration

### Adding Slave Nodes in Jenkins

1. **Access Jenkins Master**: Open the Jenkins Dashboard on the master node.
2. **Navigate to Manage Nodes**: Go to 'Manage Jenkins' > 'Manage Nodes and Clouds'.
3. **Add a New Node**: 

   - Enter a name for the slave node.
   - Select 'Permanent Agent'.
   - Configure the node settings.
4. **Configure Node Settings**: 

   - Set the number of executors (jobs the node can run simultaneously).
   - Specify the remote root directory (workspace for Jenkins on the slave node).
   - Add labels for easy identification and job assignments.
   - Determine the node's usage (how the Jenkins jobs will utilize this node).
   - Select the 'Launch method', typically 'Launch agents via SSH' for secure communication.
   - Enter the host IP or DNS name of the slave node.
   - **Configure SSH Credentials**: Add SSH credentials for secure connection between master and slave. This involves:
     - SSH username of the slave machine.
     - SSH private key for authentication (ensure the corresponding public key is in the `authorized_keys` on the slave node).
5. **Save Node Configuration**: 
   - After setting all configurations, save the node settings.

---

This guide provides an overview of setting up a Jenkins master-slave architecture. For specific details and advanced configurations, refer to the Jenkins documentation or other detailed guides.
