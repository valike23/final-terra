# variables.tf

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "name" {
  description = "Name prefix for resources"
  type        = string
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "azs" {
  description = "Availability Zones"
  type        = list(string)
}

variable "private_subnets" {
  description = "Private subnet CIDRs"
  type        = list(string)
}

variable "public_subnets" {
  description = "Public subnet CIDRs"
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "Enable NAT Gateway"
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "Use single NAT Gateway"
  type        = bool
  default     = true
}

variable "host_name" {
  description = "Hostname for the application"
  type        = string
}

variable "domain_name" {
  description = "Domain name for the application"
  type        = string
}

variable "certificate_arn" {
  description = "SSL certificate ARN"
  type        = string
}

variable "create_log_bucket" {
  description = "Create S3 bucket for logs"
  type        = bool
  default     = true
}

variable "enable_logging" {
  description = "Enable logging for ALB"
  type        = bool
  default     = true
}

variable "force_destroy_log_bucket" {
  description = "Force destroy log bucket"
  type        = bool
  default     = true
}

variable "log_bucket_name" {
  description = "S3 bucket name for ALB logs"
  type        = string
}

variable "container_definitions" {
  description = "Container definitions for ECS task"
  type        = string
}

variable "container_name" {
  description = "Name of the container"
  type        = string
  default     = "nginx"
}

variable "container_port" {
  description = "Port on which container listens"
  type        = number
  default     = 80
}

variable "log_groups" {
  description = "Log groups for ECS service"
  type        = list(string)
  default     = ["ecs-alb-single-svc-nginx"]
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
}
