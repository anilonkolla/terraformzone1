variable "aws_vpc_cidr" {
  type        = string
  default     = "192.168.0.0/16"
  description = "this is vpc "

}

variable "aws_subnet_ranges" {
  type        = list(string)
  default     = ["192.168.0.0/24", "192.168.1.0/24", "192.168.2.0/24"]
  description = "this is  subnets"
}

variable "aws_subnet" {
  type        = string
  default     = "192.168.3.0/24"
  description = "this is subnet"

}

variable "aws_subnet_names" {
  type        = list(string)
  default     = ["sub1", "sub2", "sub3"]
  description = "this is subnet names"

}

variable "web_sg_config" {
  type = object({
    name        = string
    description = string
    rules = list(object({
      type       = string
      from_port  = number
      to_port    = number
      protocol   = string
      cidr_block = string
    }))
  })
  default = {
    name        = "sgrules"
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


}

variable "public_key_path" {
  type    = string
  default = "C:/Users/reddy/.ssh/id_rsa.pub"

}
