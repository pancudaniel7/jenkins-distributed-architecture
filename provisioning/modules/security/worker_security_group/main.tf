resource "aws_security_group" "ec2_security_groups" {
  name        = "${var.ec2_security_group_name}-security-groups"
  vpc_id = var.vpc_id

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.ec2_security_group_name}-security-groups"
  }
}