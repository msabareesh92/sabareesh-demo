variable "aws_region" {
    description = "AWS Resource Region"
    type = string
    default = "us-east-1"
  
}

variable "aws_ami" {
    description = "AWS EC2 ami"
    type = string
    default = "ami-007855ac798b5175e"

}

variable "aws_instancetype" {
    description = "AWS EC2 instance type"
    type = string
    default = "t2.micro"
    
  
}

variable "ports" {
    description = "Sg port number"
    type = number
    default = 8080
  
}
