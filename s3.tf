resource "aws_s3_bucket" "unl3ash" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_versioning" "unl3ash" {
  bucket = aws_s3_bucket.unl3ash.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "unl3ash" {
  bucket = aws_s3_bucket.unl3ash.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "unl3ash" {
  bucket = aws_s3_bucket.unl3ash.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
