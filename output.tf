output "website_url" {
  description = "URL pour accéder à la page d'accueil du site web statique via MinIO."
  value       = "http://${var.minio_server}/${minio_s3_bucket.web_bucket.bucket}/${minio_s3_object.index_html.id}"
}

output "bucket_name" {
  description = "Nom du bucket S3 créé pour le site web"
  value       = minio_s3_bucket.web_bucket.bucket
}