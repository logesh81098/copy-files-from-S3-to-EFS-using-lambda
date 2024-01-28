module "vpc" {
  source = "./module/vpc"
}

module "s3" {
  source = "./module/s3"
}