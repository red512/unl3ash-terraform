output "ecr_repository_url" {
  description = "ECR repository URL for the unl3ash app image"
  value       = aws_ecr_repository.unl3ash.repository_url
}

output "unl3ash_irsa_role_arn" {
  description = "IRSA role ARN for the unl3ash ServiceAccount (set in GitOps values.yaml)"
  value       = module.unl3ash_irsa_role.iam_role_arn
}

output "github_actions_ecr_role_arn" {
  description = "IAM role ARN for GitHub Actions to push images to ECR via OIDC"
  value       = aws_iam_role.github_actions_ecr_push.arn
}
