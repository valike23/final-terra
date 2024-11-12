# modules/alb/variables.tf

variable "name" {
  description = "Name of the ALB"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for the ALB"
  type        = string
}

variable "subnets" {
  description = "List of subnet IDs for ALB"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security group ID for ALB"
  type        = string
}

variable "tags" {
  description = "Tags for ALB resources"
  type        = map(string)
}
