output machine_1_ip {
  value       = aws_instance.machine-1.public_ip
}

output machine_2_ip {
  value       = aws_instance.machine-2.public_ip
}

output machine_3_ip {
  value       = aws_instance.machine-3.public_ip
}

output machine_4_ip {
  value       = aws_instance.machine-4.public_ip
}

output "ecr_url" {
  value = aws_ecr_repository.app-image-storage-production.repository_url
}