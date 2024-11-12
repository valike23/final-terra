# modules/ecs_cluster/variables.tf

variable "name" {
  description = "Name prefix for the ECS Cluster"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for the ECS Cluster"
  type        = string
}

variable "allowed_ingress_cidr" {
  description = "List of CIDR blocks allowed for inbound traffic"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "tags" {
  description = "Tags for ECS Cluster resources"
  type        = map(string)
}
