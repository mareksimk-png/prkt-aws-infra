# SG pro EC2
resource "aws_security_group" "ec2" {
  name        = "${var.project_name}-ec2-sg"
  description = "Security group pro EC2"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH z moji IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  ingress {
    description = "HTTP z moji IP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  egress {
    description = "Vesker odchozi provoz"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.project_name}-ec2-sg"
    Project     = var.project_name
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}

# SG pro VPC Endpoints
resource "aws_security_group" "vpc_endpoints" {
  name        = "${var.project_name}-vpc-endpoints-sg"
  description = "Security group pro VPC endpointy"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "HTTPS z VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.project_name}-vpc-endpoints-sg"
    Project     = var.project_name
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}