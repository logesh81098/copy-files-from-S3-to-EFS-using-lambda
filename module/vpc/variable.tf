variable "vpc-cidr-block" {
  default = "10.0.0.0/16"
}

variable "project-name" {
  default = "s3-to-efs"
}

variable "subnet-1-cidr" {
  default = "10.0.1.0/28"
}

variable "subnet-2-cidr" {
  default = "10.0.2.0/28"
}

variable "subnet-3-cidr" {
  default = "10.0.3.0/28"
}

variable "availability-zone-1" {
  default = "ap-south-1a"
}

variable "availability-zone-2" {
  default = "ap-south-1b"
}

variable "availability-zone-3" {
  default = "ap-south-1c"
}