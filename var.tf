variable "minio_server" {
  type        = string
  description = "Adresse du serveur MinIO"
  default     = "127.0.0.1:9000"
}

variable "minio_access_key" {
  type        = string
  description = "Clé d'accès MinIO"
  sensitive   = true
  default     = "minioadmin"
}

variable "minio_secret_key" {
  type        = string
  description = "Mot de passe MinIO"
  sensitive   = true
  default     = "minioadmin"
}

variable "bucket_name" {
  type        = string
  description = "Nom du bucket web"
  default     = "webbucket"
}

