# alb/terragrunt.hcl

terraform {
  source = "../modules/alb"
}

dependencies {
  paths = ["../vpc", "../ecs_cluster"]
}

inputs = {
  name                     = "ecs-alb-single-svc"
  vpc_id                   = dependency.vpc.outputs.vpc_id
  subnets                  = dependency.vpc.outputs.public_subnets
  security_group_id        = dependency.ecs_cluster.outputs.security_group_id
  certificate_arn          = "arn:aws:iam::123456789012:server-certificate/test_cert-123456789012"
  create_log_bucket        = true
  enable_logging           = true
  force_destroy_log_bucket = true
  log_bucket_name          = "ecs-alb-single-svc-logs"

  tags = {
    Owner       = "user"
    Environment = "me"
  }
}
