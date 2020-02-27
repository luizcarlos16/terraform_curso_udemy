output "id" {
  value = aws_s3_bucket.this.id
}

output "object" {
  value = aws_s3_bucket_object.this.*.key
}

output "arn" { 
    value = aws_s3_bucket.this.arn
}

output "hosted_zone_id" {
  value = aws_s3_bucket.this.hosted_zone_id
}
