resource "aws_s3_bucket" "buckets" {
  for_each = {
    "bucket1" = "matipur"
    "bucket2" = "atmakur"
    "bucket3" = "jural"
  }
  bucket = each.value
  tags = {
    name = each.value
  }
}
