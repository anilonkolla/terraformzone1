variable "aws_vpc_cidr" {
  type        = string
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
  description = "this is web security group rule"
}

variable "app_sg_config" {
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
  description = "this is app security group rules"
}


variable "public_key_path" {
  type    = string
  default = "C:/Users/reddy/.ssh/id_rsa.pub"

}
