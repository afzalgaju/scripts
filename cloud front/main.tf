resource "aws_cloudfront_function" "cloud-front" {
  name    = "test"
  runtime = "cloudfront-js-1.0"
  comment = "my function"
  publish = true
  code    = file("${path.module}/function.js")
}