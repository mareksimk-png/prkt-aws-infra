resource "aws_instance" "app" {
  ami                    = data.aws_ami.amazon_linux_2023.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.ec2.id]
  iam_instance_profile   = aws_iam_instance_profile.ec2_ssm.name

  user_data = file("${path.module}/user_data.sh")

  tags = {
    Name        = "${var.project_name}-app-server"
    Project     = var.project_name
    Environment = "dev"
    ManagedBy   = "terraform"
  }

  # Ignoruj zmeny AMI (aby se instance nenahrazovala pri nove verzi)
  lifecycle {
    ignore_changes = [ami]
  }

  # Pockej, az bude sit pripravena PRED vytvorenim instance
  depends_on = [
    aws_nat_gateway.main,
    aws_route_table_association.private,
    aws_vpc_endpoint.ssm,
    aws_vpc_endpoint.ssmmessages,
    aws_vpc_endpoint.ec2messages,
    aws_vpc_endpoint.s3
  ]
}