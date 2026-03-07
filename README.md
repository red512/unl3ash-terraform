# unl3ash-terraform

Infrastructure as Code for the [unl3ash](https://github.com/red512/unl3ash) project.

> Full project documentation is in the [application repo README](https://github.com/red512/unl3ash).

## Related Repositories

- **[unl3ash](https://github.com/red512/unl3ash)** — Application source code, CI/CD pipelines, Dockerfile
- **[unl3ash-gitops](https://github.com/red512/unl3ash-gitops)** — Helm chart, ArgoCD application manifests
- **[unl3ash-terraform](https://github.com/red512/unl3ash-terraform)** — Infrastructure as Code (EKS, VPC, IAM, S3, ECR)

## Overview

Terraform provisions all AWS resources using community modules.

**Checkov** (`checkov.yaml`) — IaC security scanning on push/PR to `main`:
`Terraform Scan -> Slack Notification`

Known acceptable findings (demo scope) are suppressed via `.checkov.yml` with documented reasoning.

## Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `cluster_name` | `unl3ash-eks` | EKS cluster name |
| `bucket_name` | `unl3ash-bucket` | S3 bucket name |
| `worker_group_instance_type` | `["t3.medium"]` | EC2 instance types |
| `github_repository` | `red512/unl3ash` | GitHub repo for OIDC trust |

## Project Structure

```
unl3ash-terraform/
├── aws-provider.tf              # Provider config (us-east-1)
├── backend.tf                   # Remote state (S3 + DynamoDB) — template
├── variables.tf                 # Input variables with defaults
├── outputs.tf                   # ECR URL, IRSA ARN, bucket name
├── data.tf                      # AWS caller identity
├── vpc.tf                       # VPC, subnets, NAT gateway
├── eks.tf                       # EKS cluster + managed node groups
├── iam.tf                       # IRSA, OIDC, admin roles/policies
├── s3.tf                        # S3 bucket + encryption + versioning
├── ecr.tf                       # ECR repository + lifecycle policy
├── helm-provider.tf             # Helm provider for EKS
├── argocd.tf                    # ArgoCD Helm release
├── load-balancer-controller.tf  # AWS LB Controller Helm release
├── .checkov.yml                 # Checkov suppressions with reasoning
├── bootstrap/
│   └── main.tf                  # State bucket + DynamoDB (one-time)
└── helm-values/
    └── argocd-values.yaml       # ArgoCD Helm overrides
```
