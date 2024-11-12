# modules/ecs_cluster/outputs.tf

output "cluster_id" {
  description = "ECS Cluster ID"
  value       = aws_ecs_cluster.this.id
}

output "security_group_id" {
  description = "Security Group ID for ECS instances"
  value       = aws_security_group.ecs_sg.id
}
