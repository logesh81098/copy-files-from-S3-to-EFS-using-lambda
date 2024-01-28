module "vpc" {
  source = "./module/vpc"
}

module "s3" {
  source = "./module/s3"
}

module "efs" {
  source = "./module/efs"
  public-subnet-1-id = module.vpc.public-subnet-1-id
  public-subnet-2-id = module.vpc.public-subnet-2-id
  public-subnet-3-id = module.vpc.public-subnet-3-id
  efs-sg = module.security-group.efs-sg-id
}

module "security-group" {
  source = "./module/security-groups"
  vpc-id = module.vpc.vpc-id
}