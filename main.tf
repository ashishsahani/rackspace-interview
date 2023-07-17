terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-west-2"
}

resource "aws_lambda_layer_version" "python37-pandas-layer" {
  filename            = "requests.zip"
  layer_name          = "requests_layer_py"
  source_code_hash    = "${filebase64sha256("requests.zip")}"
  compatible_runtimes = ["python3.6", "python3.10"]
}

resource "aws_lambda_function" "count_eye_colors" {
  filename = "count_eye_colors.zip"
  function_name = "count_eye_colors"
  role = "${aws_iam_role.lambda_role.arn}"
  handler = "lambda_handler"
  runtime = "python3.8"
  memory_size = 128
  timeout = 300
  layers = ["${aws_lambda_layer_version.requests_layer_py.arn}"]
}

resource "aws_iam_role" "lambda_role" {
  name = "count_eye_colors"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}
