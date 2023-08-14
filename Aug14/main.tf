resource "aws_vpc" "vpcaws" {
  cidr_block = "192.168.0.0/16"

  tags = {
    name = "vpcaws"
  }

}

resource "aws_subnet" "sub6" {
  vpc_id     = aws_vpc.vpcaws.id
  cidr_block = var.aws_subnet

}

resource "aws_subnet" "subntes" {
  count      = length(var.aws_subnet_names)
  vpc_id     = aws_vpc.vpcaws.id
  cidr_block = var.aws_subnet_ranges[count.index]

  tags = {
    name = var.aws_subnet_names[count.index]
  }


}

resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.vpcaws.id

  tags = {
    name = "igway"
  }
  depends_on = [aws_subnet.subntes]

}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpcaws.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig.id

  }

  tags = {
    name = "awsrt"
  }

  depends_on = [aws_internet_gateway.ig]
}

resource "aws_route_table_association" "rtassociation" {
  subnet_id      = aws_subnet.sub6.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_key_pair" "private" {
  key_name   = "keypair"
  public_key = file(var.public_key_path)
  tags = {
    CreatedBy = "me"
  }
}

resource "aws_instance" "ntier1" {
  ami                         = "ami-0f5ee92e2d63afc18"
  instance_type               = "t3.micro"
  associate_public_ip_address = true
  key_name                    = "keypair"
  subnet_id                   = aws_subnet.sub6.id
  vpc_security_group_ids      = [aws_security_group.allow_tls.id]

  tags = {
    name = "terraform"
  }
}
