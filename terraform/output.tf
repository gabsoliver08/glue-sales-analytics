output "data_bucket_id" {
  description = "ID of the S3 bucket to store data"
  value       = aws_s3_bucket.data_bucket.id
}
