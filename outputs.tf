output "vpc_id" {
  description = "ID VPC"
  value       = aws_vpc.main.id
}

output "instance_id" {
  description = "ID EC2 instance"
  value       = aws_instance.app.id
}

output "public_subnet_id" {
  description = "ID verejne podsiti"
  value       = aws_subnet.public.id
}

output "private_subnet_id" {
  description = "ID privatni podsiti"
  value       = aws_subnet.private.id
}

output "ssm_connect_command" {
  description = "Pripojeni k instanci pres SSM"
  value       = "aws ssm start-session --target ${aws_instance.app.id} --region ${var.aws_region}"
}