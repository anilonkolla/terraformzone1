aws_vpc_cidr     = "192.168.0.0/16"
aws_subnet_names = ["sub1", "sub2", "sub3"]
web_sg_config = {
  name        = "websg"
  description = "this is sg rules"
  rules = [{
    type       = "ingress"
    from_port  = "80"
    to_port    = "80"
    protocol   = "tcp"
    cidr_block = "0.0.0.0/0"
    },
    {
      type       = "ingress"
      from_port  = "22"
      to_port    = "22"
      protocol   = "tcp"
      cidr_block = "0.0.0.0/0"
    },

    {
      type       = "egress"
      from_port  = "0"
      to_port    = "65535"
      protocol   = "-1"
      cidr_block = "0.0.0.0/0"
    }
  ]

}

app_sg_config = {
  name        = "appsg"
  description = "this is sg rules"
  rules = [{
    type       = "ingress"
    from_port  = "80"
    to_port    = "80"
    protocol   = "tcp"
    cidr_block = "0.0.0.0/0"
    },
    {
      type       = "ingress"
      from_port  = "3000"
      to_port    = "3000"
      protocol   = "tcp"
      cidr_block = "0.0.0.0/0"
    },
    {
      type       = "ingress"
      from_port  = "22"
      to_port    = "22"
      protocol   = "tcp"
      cidr_block = "0.0.0.0/0"
    }



  ]

}
