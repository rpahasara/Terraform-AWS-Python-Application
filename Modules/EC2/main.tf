resource "aws_instance" "ec2" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_security_group_ids = [var.ec2_sg_id] 
    subnet_id = var.subnet_id 

    associate_public_ip_address = true

    tags = {
        Name = "Python App Server"
    }

    connection {
        type        = "ssh"
        user        = "ubuntu"                # or ec2-user, depending on the AMI
        private_key = file("C:/Users/ravin/Downloads/aws-new.pem")
        host        = self.public_ip
    }

    provisioner "file" {
        source = "${path.root}/app"
        destination = "/home/ubuntu"
    }

    provisioner "file" {
        source = "${path.root}/Scripts"
        destination = "/home/ubuntu"
    }

    provisioner "remote-exec" {
        inline = [
            "chmod +x /home/ubuntu/Scripts/install_app.sh",
            "/home/ubuntu/Scripts/install_app.sh"
        ]
    }
}   
