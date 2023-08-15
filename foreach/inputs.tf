variable "buckets" {
  type = list(object({
    name   = string
    region = string
  }))
  default = [{
    name   = "matsipur"
    region = "us-west-1"
    },
    {
      name   = "atmakur"
      region = "us-west-2"
    },
    {
      name   = "jural"
      region = "us-east-2"
  }]
}