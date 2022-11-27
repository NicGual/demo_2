output machine_1_ip {
  value       = aws_instance.machine-1.public_ip
}

output machine_2_private_ip {
  value       = aws_instance.machine-2.private_ip
}