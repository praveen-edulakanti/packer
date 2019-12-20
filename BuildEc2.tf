provider "aws" {
  region = "ap-south-1"
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "web" {
  #ami           = "ami-0ca5a393d9da7f4c2" #UPDATE YOUR AMI MACHINE ID
  ami = data.aws_ami.latest-ubuntu.id
  instance_type = "t2.micro"
  key_name  = "terraform-demo"

  tags = {
    Name = "Packer-Terraform-Import"
  }
}

data "aws_ami" "latest-ubuntu" {
most_recent = true
owners = [""] # Canonical

  filter {
      name   = "name"
      values = ["Packer-App-UbuntuMysql *"]
  }

  filter {
      name   = "virtualization-type"
      values = ["hvm"]
  }
}