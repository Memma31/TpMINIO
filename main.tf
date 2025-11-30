terraform {
    required_providers {
        minio = {
            source = "terraform-provider-minio/minio"
            version = ">= 3.1.0"
        }
    }
}
provider "minio" {
    minio_server = var.minio_server
    minio_user = var.minio_access_key
    minio_password = var.minio_secret_key
    minio_ssl = false
}
resource "minio_s3_bucket" "web_bucket" {
    bucket = var.bucket_name
}
resource "minio_s3_object" "index_html" {
    bucket_name = minio_s3_bucket.web_bucket.bucket
    object_name = "index.html"
    source = "index.html"
}
resource "minio_s3_object" "style_css" {
    bucket_name = minio_s3_bucket.web_bucket.bucket
    object_name = "style.css"
    source = "style.css"
}

resource "minio_iam_policy" "public_bucket_policy" {
  name = "webbucket-public"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = ["s3:GetObject"]
        Resource = ["arn:aws:s3:::${var.bucket_name}/*"]
        Principal = "*"
      }
    ]
  })
}