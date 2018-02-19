resource "aws_s3_bucket" "terraform-state" {
    bucket = "terraform-state-rk840522"
    acl = "private"

    tags {
        Name = "Terraform state"
    }
    force_destroy = true
}
