output "remote_state_bucket_name" {
    value = module.bucket.name
}

output "remote_state_bucket_arn" {
    value = module.bucket.arn
}

output "remote_state_bucket_hosted_zone_id" {
  value = module.bucket.hosted_zone_id
}
