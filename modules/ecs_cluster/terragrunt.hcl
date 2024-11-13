# ecs_cluster/terragrunt.hcl

terraform {
  source = "../modules/ecs_cluster"
}

dependencies {
  paths = ["../vpc"]
}

inputs = {
  name               = "ecs-alb-single-svc"
  vpc_id             = dependency.vpc.outputs.vpc_id
  allowed_ingress_cidr = ["0.0.0.0/0"]

  tags = {
    Owner       = "user"
    Environment = "me"
  }
}
