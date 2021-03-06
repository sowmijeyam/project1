provider "aws" {
  version = "~> 2.0"
  region = "us-west-2"
}

variable "acc_no" {
  type = string
  default = "869928091105"
}
variable "access_key" {
  type = string
  default = "AKIA4VC6BHXQ62LXD7G2"
}
variable "secret_access_key" {
  type = string
  default = "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"
}

resource "aws_vpc" "hitech" {
  cidr_block = "172.27.0.0/16"
  
  tags = {
    Name = "hitech"
  }
 }
 
resource "aws_subnet" "sowmi" {
  cidr_block = "172.27.0.0/24"
  vpc_id = aws_vpc.hitech.id
  
  tags = {
    Name = "sowmi"
  }
 }
 
resource "aws_internet_gateway" "subha" {
  vpc_id = aws_vpc.hitech.id
  
  tags = {
    Name = "subha"
  }
 }
  
resource "aws_route_table" "raji" {
  vpc_id = aws_vpc.hitech.id
   tags={
   Name="raji"
  }
 }
 
resource "aws_route_table_association" "Routetableacco" {
  subnet_id      = aws_subnet.sowmi.id
  route_table_id = aws_route_table.raji.id
} 
 resource "aws_security_group" "group1" {
  vpc_id      = aws_vpc.hitech.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [aws_vpc.hitech.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "jeni" {
  ami          		 = "ami-07315f74f3fa6a5a3" # ap-southeast-1
  instance_type 	 = "t2.micro"
}





