output "ecr_url" {
  value = aws_ecr_repository.dev-image-storage.repository_url
}