# main.tf

provider "aws" {
  region = var.region
}

# VPC module
module "vpc" {
  source             = "./modules/vpc"
  name               = var.name
  cidr_block         = var.cidr_block
  azs                = var.azs
  private_subnets    = var.private_subnets
  public_subnets     = var.public_subnets
  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway
  tags               = var.common_tags
}

# ECS Cluster module
module "ecs_cluster" {
  source     = "./modules/ecs_cluster"
  name       = var.name
  vpc_id     = module.vpc.vpc_id
  subnets    = module.vpc.private_subnets
  tags       = var.common_tags
}

# ALB module
module "alb" {
  source                 = "./modules/alb"
  name                   = var.name
  vpc_id                 = module.vpc.vpc_id
  subnets                = module.vpc.public_subnets
  host_name              = var.host_name
  domain_name            = var.domain_name
  certificate_arn        = var.certificate_arn
  backend_sg_id          = module.ecs_cluster.security_group_id
  create_log_bucket      = var.create_log_bucket
  enable_logging         = var.enable_logging
  log_bucket_name        = var.log_bucket_name
  force_destroy_log_bucket = var.force_destroy_log_bucket
  tags                   = var.common_tags
}

# ECS Task Definition
resource "aws_ecs_task_definition" "app" {
  family                = var.name
  container_definitions = jsonencode(var.container_definitions)
}

# ECS Service module
module "ecs_service" {
  source               = "./modules/ecs_service"
  name                 = var.name
  cluster_id           = module.ecs_cluster.cluster_id
  target_group_arn     = module.alb.target_group_arn
  container_name       = var.container_name
  container_port       = var.container_port
  task_definition_arn  = aws_ecs_task_definition.app.arn
  log_groups           = var.log_groups
  tags                 = var.common_tags
}
