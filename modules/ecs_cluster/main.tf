# modules/ecs_cluster/main.tf

resource "aws_ecs_cluster" "this" {
  name = var.name
  tags = var.tags
}

# Security group for ECS instances
resource "aws_security_group" "ecs_sg" {
  name_prefix = "${var.name}-ecs-sg"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "-1"
    cidr_blocks = var.allowed_ingress_cidr
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}
