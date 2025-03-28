# Provider Configuration
provider "aws" {
  region = "ap-south-1"   # Replace with your region
}

# Security Group Resource
resource "aws_security_group" "my_sg" {
  name        = "terrform-sg"
  description = "security_group form by terraform"
  vpc_id      = "vpc-0f56c1645f68cb682"   # Replace with your VPC ID

  ingress {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]   # Open to all IPs
  }

  tags = {
    Name  = "https-sg"
    Usage = "443-only"
  }
}

# Output the Security Group ID
output "sg_id" {
  description = "The ID of the Security Group"
  value       = aws_security_group.my_sg.id
}