resource "aws_security_group" "ec2_sg" {
    name = "ec2_sg"
    description = "Security group for the EC2 instance"
    vpc_id = var.vpc_id

    ingress {
        description = "SSH access"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "Flask app access"
        from_port   = 5000
        to_port     = 5000
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
  }

    egress {
        description = "Outbound access"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "Python App Security Group"
    }
}
