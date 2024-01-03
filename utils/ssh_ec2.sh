#!/bin/bash

# Params:
# 1 - instance ip
# 2 - ssh public key file
# 3 - ec2 machine user

# EC2 instance details
instance_ip=$1
ssh_key_path="$HOME/.ssh/$2"
ssh_user="${3:-ubuntu}"

# SSH connection options
ssh_options="-i $ssh_key_path -o StrictHostKeyChecking=no"

# SSH into the EC2 instance
ssh $ssh_options $ssh_user@$instance_ip

