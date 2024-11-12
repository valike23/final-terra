# modules/ecs_service/variables.tf

variable "name" {
  description = "Name of the ECS service"
  type        = string
}

variable "cluster_id" {
  description = "ECS Cluster ID"
  type        = string
}

variable "task_definition_arn" {
  description = "ARN of the ECS task definition"
  type        = string
}

variable "desired_count" {
  description = "Desired number of ECS service tasks"
  type        = number
  default     = 1
}

variable "subnets" {
  description = "List of subnets for ECS tasks"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security group ID for ECS tasks"
  type        = string
}

variable "target_group_arn" {
  description = "Target group ARN for the ALB"
  type        = string
}

variable "container_name" {
  description = "Name of the container"
  type        = string
}

variable "container_port" {
  description = "Port on which the container listens"
  type        = number
}

variable "tags" {
  description = "Tags for the ECS service"
  type        = map(string)
}
