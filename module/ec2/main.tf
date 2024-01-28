#############################################################################################################
#                                  Creating EC2 instance
#############################################################################################################
resource "aws_instance" "test-server" {
  ami = var.ami
  instance_type = var.instance-type
  subnet_id = var.public-subnet-3-id
  security_groups = [var.ec2-sg]
  key_name = aws_key_pair.test-server-key.key_name
  associate_public_ip_address = true
  user_data = <<-EOF
  #!/bin/bash
  sudo yum update -y
  cd /
  sudo mkdir /s3-to-efs
  sudo yum install nfs-utils -y -q
  sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport fs-0e951f621c183cdc5.efs.ap-south-1.amazonaws.com:/ /s3-to-efs
  echo fs-0e951f621c183cdc5:/ /s3-to-efs nfs4 defaults,_netdev 0 0  | sudo cat >> /etc/fstab
  EOF
  tags = {
    Name = "${var.project-name}-Server"
  }
}

#############################################################################################################
#                                  Creating keypair
#############################################################################################################
resource "tls_private_key" "project-key" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "aws_key_pair" "test-server-key" {
  key_name = "s3-to-efs-key"
  public_key = tls_private_key.project-key.public_key_openssh
}

resource "local_file" "project-key-pem" {
  filename = "s3-to-efs-pem"
  content = tls_private_key.project-key.private_key_pem
}