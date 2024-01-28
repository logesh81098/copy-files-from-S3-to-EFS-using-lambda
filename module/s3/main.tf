############################################################################################################
#                                    Creating S3 bucket
############################################################################################################
resource "aws_s3_bucket" "project-bucket" {
  bucket = var.bucket-name
  acl = "private"
}

resource "aws_s3_bucket_notification" "project-lambda-notification" {
  bucket = aws_s3_bucket.project-bucket.id
  lambda_function {
    lambda_function_arn = var.lambda-arn
    events = ["s3:ObjectCreated:*"]
  }
}