# Define your provider and AWS region
provider "aws" {
  region = "ap-south-1" 
}

# Create a VPC
resource "aws_vpc" "example_vpc" {
  cidr_block = "10.0.0.0/16"
}

# Create a private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.example_vpc.id
  cidr_block = "10.0.1.0/24" 
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = false
}

# Create a security group for the RDS instance
resource "aws_security_group" "rds_security_group" {
  name        = "rds-sg"
  description = "RDS security group"
  vpc_id      = aws_vpc.example_vpc.id

  # Allow incoming traffic only from the specific VM
  ingress {
    from_port   = 3306 
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["172.31.36.8/32"] 
  }
}

# Create an RDS instance
resource "aws_db_instance" "example_rds" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql" 
  engine_version       = "5.7"   
  instance_class       = "db.t2.micro"
  name                 = "exampledb" 
  username             = "admin"    
  password             = "admin123" 
  parameter_group_name = "default.mysql5.7"

  vpc_security_group_ids = [aws_security_group.rds_security_group.id]
  subnet_group_name      = "default"
  skip_final_snapshot    = true
  publicly_accessible    = false
  storage_encrypted      = true
  multi_az               = false

  
  subnet_ids = [aws_subnet.private_subnet.id]
}
