##############################################################################################################
#                                 Creating Security Group for EFS
##############################################################################################################
resource "aws_security_group" "efs-security-group" {
  vpc_id = var.vpc-id
  name = "efs-sg"
  description = "security group for EFS filesystem"
  ingress {
    from_port = 2049
    to_port = 2049
    protocol = "tcp"
    cidr_blocks = [var.public-subnet-1-cidr, var.public-subnet-2-cidr, var.public-subnet-3-cidr]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


##############################################################################################################
#                                 Creating Security Group for EC2
##############################################################################################################
resource "aws_security_group" "ec2-sg" {
  vpc_id = var.vpc-id
  name = "ec2-sg"
  description = "security group for EC2 instance"
  ingress {
    from_port = 2049
    to_port = 2049
    protocol = "tcp"
    cidr_blocks = [var.public-subnet-1-cidr, var.public-subnet-2-cidr, var.public-subnet-3-cidr]
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}