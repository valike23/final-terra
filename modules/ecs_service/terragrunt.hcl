# ecs_service/terragrunt.hcl

terraform {
  source = "../modules/ecs_service"
}

dependencies {
  paths = ["../ecs_cluster", "../alb"]
}

inputs = {
  name                 = "ecs-alb-single-svc"
  cluster_id           = dependency.ecs_cluster.outputs.cluster_id
  task_definition_arn  = "your-task-definition-arn"  # Replace with actual task definition ARN or add another dependency
  desired_count        = 1
  subnets              = dependency.vpc.outputs.private_subnets
  security_group_id    = dependency.ecs_cluster.outputs.security_group_id
  target_group_arn     = dependency.alb.outputs.target_group_arn
  container_name       = "nginx"
  container_port       = 80

  tags = {
    Owner       = "user"
    Environment = "me"
  }
}
