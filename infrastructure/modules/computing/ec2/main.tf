resource "random_id" "ssh_key_suffix" {
  byte_length = 8
}

resource "aws_key_pair" "main" {
  key_name   = "${var.public_key_name}-${random_id.ssh_key_suffix.hex}"
  public_key = file("${var.public_key_path}/${var.public_key_name}.pub")
}

resource "aws_instance" "ec2_instance" {
  ami           = "${var.ami_id}" 
  instance_type = "${var.instance_type}"
  subnet_id = "${var.subnet_id}"

  key_name = aws_key_pair.main.key_name
  vpc_security_group_ids = [var.security_group_id]
  associate_public_ip_address = true

  tags = {
    Name = "${var.name}"
  }
}
