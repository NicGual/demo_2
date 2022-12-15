output "ecr_url" {
  value = aws_ecr_repository.app-image-storage-production.repository_url
}