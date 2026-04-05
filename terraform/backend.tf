terraform {
  backend "s3" {
    bucket = "nick-demo-tfstate-bucket"
    key    = "eks/terraform.tfstate"
    region = "eu-west-1"
  }
}


