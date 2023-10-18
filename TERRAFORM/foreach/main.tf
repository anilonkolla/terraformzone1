resource "aws_s3_bucket" "buckets" {
  for_each = {
    "bucket1" = "terraform1"
    "bucket2" = "terraform2"
    "bucket3" = "terraform3"
  }
  bucket = each.value
  tags = {
    name = each.value
  }
}
