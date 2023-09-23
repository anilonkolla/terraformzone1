variable "buckets" {
  type = list(object({
    name   = string
    region = string
  }))
  default = [{
    name   = "terraform1"
    region = "ap-south-1"
    },
    {
      name   = "terraform2"
      region = "us-west-2"
    },
    {
      name   = "terraform3"
      region = "us-east-2"
  }]
}