output "bucket" {
  value = aws_s3_bucket.project-bucket.bucket
}

output "bucket-arn" {
  value = aws_s3_bucket.project-bucket.arn
}