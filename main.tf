module "vpc" {
    source = "./Modules/VPC"
    vpc_cidr = "10.0.0.0/16"
    subnet_cidr = "10.0.1.0/24"
    availability_zone = "us-east-1a"
}

module "security_group" {
    source = "./Modules/Security-Group"
    vpc_id = module.vpc.vpc_id
}

module "ec2" {
    source = "./Modules/EC2"
    ami = "ami-084568db4383264d4"
    instance_type = "t2.micro"
    key_name = "aws-new"
    subnet_id = module.vpc.subnet_id
    ec2_sg_id = module.security_group.ec2_sg_id
}

