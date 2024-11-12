variable "name" {
  type        = string
  description = "Name prefix for the VPC"
}

variable "cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "azs" {
  type        = list(string)
  description = "Availability Zones for subnets"
}

variable "private_subnets" {
  type        = list(string)
  description = "CIDR blocks for private subnets"
}

variable "public_subnets" {
  type        = list(string)
  description = "CIDR blocks for public subnets"
}

variable "enable_nat_gateway" {
  type        = bool
  description = "Whether to enable NAT gateway"
}

variable "single_nat_gateway" {
  type        = bool
  description = "Whether to use a single NAT gateway"
}

variable "tags" {
  type        = map(string)
  description = "Tags for the VPC resources"
}
