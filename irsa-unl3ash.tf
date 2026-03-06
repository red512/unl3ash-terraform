module "unl3ash_irsa_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "5.3.1"

  role_name = "unl3ash-s3-access"

  oidc_providers = {
    ex = {
      provider_arn               = module.eks.oidc_provider_arn
      namespace_service_accounts = ["unl3ash:unl3ash"]
    }
  }
}

resource "aws_iam_role_policy" "unl3ash_s3_access" {
  name = "unl3ash-s3-head-object"
  role = module.unl3ash_irsa_role.iam_role_name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["s3:HeadObject"]
        Resource = "${aws_s3_bucket.unl3ash.arn}/*"
      },
      {
        Effect   = "Allow"
        Action   = ["s3:ListBucket"]
        Resource = aws_s3_bucket.unl3ash.arn
      }
    ]
  })
}
