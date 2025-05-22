terraform {
  backend "s3" {
    bucket = "Your_bucket_name" 
    key    = "secret/statefile"
    region = "us-east-1"
  }
}
