
resource "aws_key_pair" "levelup_key" {
    key_name = "levelup_key"
    public_key = file(var.PATH_TO_PUBLIC_KEY)
}


# data "aws_ami" "latest-amazon-linux-image" {
#     most_recent = true

#     filter {
#         name = "name"
#         values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-20.08-amd64-server-*"]
#     }

#     filter {
#         name = "virtualization - type"
#         vaules = ["hvm"]
#     }

#     owners = ["amazon"]
#     # filter {
#     #     name = "owner-alias"
#     #     values = ["amazon"]
#     # }

#     # filter {
#     #     name = "name"
#     #     values = ["amzn2-ami-hvm*"]
#     # }
# }

# output "ec2_instance_id" {
#     value = data.aws_ami.latest-amazon-linux-image.id
# }
resource "aws_instance" "MyFirstInstance" {

    # ami = data.aws_ami.latest-amazon-linux-image.id
    ami = lookup(var.AMIS, var.AWS_REGION)
    instance_type = "t2.micro"
    key_name = aws_key_pair.levelup_key.key_name

    tags = {
        Name = "custom_instance"
    }
    provisioner "file" {
        source = "installNginx.sh"
        destination = "/tmp/installNginx.sh"
    }
    provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/installNginx.sh",
            "sudo sed -i -e 's/\r$//' /tmp/installNginx.sh",  # Remove the spurious CR characters.
            "sudo /tmp/installNginx.sh",
        ]
    }    
    connection {
        host = coalesce(self.public_ip,self.private_ip)
        type = "ssh"
        user = var.INSTANCE_USERNAME
        private_key = file(var.PATH_TO_PRIVATE_KEY)
    }
}




