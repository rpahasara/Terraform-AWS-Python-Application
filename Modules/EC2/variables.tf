variable "instance_type" {
    description = "The type of instance to start"
    type = string
}

variable "ami" {
    description = "The AMI to use for the instance"
    type = string
}

variable "key_name" {
    description = "The key name to use for the instance"
    type = string
}

variable "subnet_id" {
    description = "The subnet ID to use for the instance"
    type = string
}

variable "ec2_sg_id" {
    description = "The security group ID to use for the instance"
    type = string
}

