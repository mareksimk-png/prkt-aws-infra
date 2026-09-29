variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}

variable "project_name" {
  description = "Nazev projektu"
  type        = string
  default     = "portfolio-iac"
}

variable "vpc_cidr" {
  description = "CIDR pro VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR pro verejnou podsit"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR pro privatni podsit"
  type        = string
  default     = "10.0.2.0/24"
}

variable "availability_zone" {
  description = "Availability zone"
  type        = string
  default     = "eu-central-1a"
}

variable "my_ip" {
  description = "Tvoje verejna IP ve formatu CIDR (napr. 1.2.3.4/32)"
  type        = string
}

variable "instance_type" {
  description = "Typ EC2 instance"
  type        = string
  default     = "t3.micro"
}