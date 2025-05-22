resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr

    tags = {
        Name = "Python App VPC"
    }
}

resource "aws_subnet" "subnet" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.subnet_cidr
    availability_zone = var.availability_zone
    map_public_ip_on_launch = true


    tags = {
        Name = "Python App Subnet"
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id

    tags = {
        Name = "Python App Internet Gateway"
    }
}

resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.main.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
        Name = "Python App Public Route Table"
    }           

}

resource "aws_route_table_association" "public_rt_association" {
    subnet_id = aws_subnet.subnet.id
    route_table_id = aws_route_table.public_rt.id
}


