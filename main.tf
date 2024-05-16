terraform {
  required_version = "~>1.4.4"
  required_providers {
    aws={
        source = "hashicorp/aws"
        version = "~>4.0"

    }
  }
}

provider "aws" {
    region = "us-east-2"
	
    profile = "default"
  
}


resource "aws_instance" "myvm" {
    ami = "ami-007855ac798b5175e"
    instance_type = "t3.micro"
    key_name = "newsaccount	"
    user_data = <<-EOF
    #!/bin/bash
    echo "Hello World" > index.html
    nohup busybox httpd -f -p 8080 &

    EOF
    user_data_replace_on_change = true
    vpc_security_group_ids = [ aws_security_group.my-sg.id]

    tags = {
      "Name" = "web"
    }

}

resource "aws_security_group" "my-sg" {
    name = "web server"
    ingress  {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]


    }
  
}