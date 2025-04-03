provider "aws" {
region = "us-east-1"
}

resource "aws_instance" "one" {
count = 5
ami = "ami-0a9a48ce4458e384e"
instance_type = "t2.medium"
key_name = "keypair"
vpc_security_group_ids = ["sg-03a7efc8e1570b9b9"]
tags = {
Name = var.instance_names[count.index]
}
}

variable "instance_names" {
default = ["jenkins", "nexus", "AppServer-1", "AppServer-2", "Monitoring server"]
}
