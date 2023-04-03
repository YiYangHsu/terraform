provider "aws" {
    access_key = "AKIATCP27AVA5AKQRR2M"
    secret_key = "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"
    region  = "us-east-2"
}

resource "aws_instance" "MyFirstInstance" {
    ami = "ami-097261bd06e355492"
    instance_type = "t2.micro"
}