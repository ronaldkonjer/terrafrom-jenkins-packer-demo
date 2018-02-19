terraform {
 required_version = ">= 0.10.1"

 backend "s3" {
  bucket = "terraform-state-rk840522"
  key = "terraform/jenkins-packer-demo"
  region = "eu-west-1"
  # dynamodb_table = "terraform-state-lock-dynamo"
  # encrypt        = true
 }
}

data "terraform_remote_state" "network" {
  backend = "s3"
  config {
    bucket = "terraform-state-rk840522"
    key = "terraform/jenkins-packer-demo"
    region = "eu-west-1"
  }
}