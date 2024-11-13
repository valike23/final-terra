# vpc/terragrunt.hcl

terraform {
  source = "../modules/vpc"
}

inputs = {
  name              = "ecs-alb-single-svc"
  cidr_block        = "10.10.10.0/24"
  azs               = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets   = ["10.10.10.0/27", "10.10.10.32/27", "10.10.10.64/27"]
  public_subnets    = ["10.10.10.96/27", "10.10.10.128/27", "10.10.10.160/27"]
  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Owner       = "user"
    Environment = "me"
  }
}
