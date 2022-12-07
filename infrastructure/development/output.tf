output machine_1_ip {
  value       = aws_instance.dev-machine-1.public_ip
}

output machine_2_ip {
  value       = aws_instance.dev-machine-2.public_ip
}

output "ecr_url" {
  value = aws_ecr_repository.dev-image-storage.repository_url
}