
# Define common provider configuration (e.g., AWS region)
terraform {
  extra_arguments "region" {
    commands = ["init", "apply", "plan"]
    arguments = ["-var", "region=us-east-1"]
  }
}