terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}


resource "aws_secretsmanager_secret" "example" {
  name = "example"
}

resource "aws_secretsmanager_secret_version" "first" {
  secret_id     = aws_secretsmanager_secret.example.id
  secret_string = "sUp3rs3cr3t"
}

data "aws_secretsmanager_secret_version" "second" {
  secret_id = aws_secretsmanager_secret.example.id
}