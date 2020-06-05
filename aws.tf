# AWS Provider hinzufügen
provider "aws" {
  region     = "eu-central-1"
  version    = "~> 2.65"
}

terraform {
  backend "s3" {
    bucket = "zh-tf-state"
    key    = "meinprojekt.tfstate"
    region = "eu-central-1"
  }
}