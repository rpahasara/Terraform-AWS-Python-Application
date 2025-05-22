terraform {
  backend "s3" {
    bucket = "rav-state-backend" 
    key    = "secret/statefile"
    region = "us-east-1"
  }
}
