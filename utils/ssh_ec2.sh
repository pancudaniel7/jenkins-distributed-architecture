#!/bin/bash

# Params:
# 1 - region (default: eu-central-1)
# 2 - ssh key name (default: jenkins-infra)
# 3 - ec2 linux user name (default: ubuntu)

output=$(aws ec2 describe-instances --region ${1:-eu-central-1} --query "Reservations[*].Instances[*].[InstanceId,PublicIpAddress,Tags[?Key=='Name'].Value | [0]]" --output text)

echo "AWS Command Output:"
echo "$output"
echo ""

declare -a instance_ids
declare -a public_ips
declare -a names

while read -r instance_id public_ip name; do
    instance_ids+=("$instance_id")
    public_ips+=("$public_ip")
    names+=("$name")
done <<< "$output"

echo "Select instance you want to conenct by typing the line number,"
read -r input

ssh -i ~/.ssh/${2:-jenkins-infra} ${3:-ubuntu}@${public_ips[((input-1))]}
