module "vpc" {
  source = "./module/vpc"
}

module "s3" {
  source = "./module/s3"
  lambda-arn = module.lambda.lambda-arn
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

module "iam-role" {
  source = "./module/iam-role"
}

module "lambda" {
  source = "./module/lambda"
  iam-role = module.iam-role.role-arn
  bucket-arn = module.s3.bucket-arn
  access-point-arn = module.efs.access-point-arn
  public-subnet-1-id = module.vpc.public-subnet-1-id
  public-subnet-2-id = module.vpc.public-subnet-2-id
  public-subnet-3-id = module.vpc.public-subnet-3-id
  efs-sg = module.security-group.efs-sg-id
}

module "ec2" {
  source = "./module/ec2"
  public-subnet-3-id = module.vpc.public-subnet-3-id
  ec2-sg = module.security-group.ec-sg-id
}