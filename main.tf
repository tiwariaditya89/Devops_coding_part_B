provider "aws" {
  region = "ap-south-1"  
}

resource "aws_instance" "wordpress_vm" {
  ami           = "ami-0c55b159cbfafe1f0" 
  instance_type = "t2.micro"  
  subnet_id     = ""  
}

output "public_ip" {
  value = aws_instance.wordpress_vm.public_ip
}
provider "aws" {
  region = "ap-south-1"  
}

resource "aws_instance" "wordpress_vm" {
  ami           = "ami-0c55b159cbfafe1f0" 
  instance_type = "t2.micro"  
  subnet_id     = "subnet-0123456789abcdef0"  
}

output "public_ip" {
  value = aws_instance.wordpress_vm.public_ip
}
