# Provider Configuration
provider "aws" {
  region = "ap-south-1"    # Replace with your AWS region
}

# Create a Key Pair
resource "aws_key_pair" "my_key" {
  key_name   = "terraform-key"  # Key name
  public_key = file("~/.ssh/id_rsa.pub")  # Path to your public key
}

# Create a Security Group with SSH and HTTP Access
resource "aws_security_group" "ec2_sg" {
  name        = "ec2-sg"
  description = "Allow SSH and HTTP"

  ingress {
    description = "Allow SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

