# store the terraform state file in s3
terraform {
  backend "s3" {
    bucket    = "terraform-backend12-11-2022"
    key       = "jupiter-website-ecs.tfstate"
    region    = "us-east-1"
    profile   = "cloud_user"
  }
}