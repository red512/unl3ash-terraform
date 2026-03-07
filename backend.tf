# Uncomment to enable remote state with S3 + DynamoDB locking.
# Bootstrap the state resources first: cd bootstrap && terraform apply
#
# terraform {
#   backend "s3" {
#     bucket         = "unl3ash-terraform-state"
#     key            = "eks/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "unl3ash-terraform-locks"
#     encrypt        = true
#   }
# }
