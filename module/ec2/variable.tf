variable "ami" {
  default = "ami-02a2af70a66af6dfb"
}

variable "instance-type" {
  default = "t3.micro"
}

variable "project-name" {
  default = "s3-to-efs"
}

variable "public-subnet-3-id" {
  default = {}
}

variable "ec2-sg" {
  default = {}
}