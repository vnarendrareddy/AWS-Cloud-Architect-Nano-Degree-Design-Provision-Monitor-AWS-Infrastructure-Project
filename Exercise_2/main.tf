provider "aws" {
  region     = "us-west-2"
  access_key = ""
  secret_key = ""
}

data "archive_file" "sample_function" {
  type        = "zip"
  source_file  = "greet_lambda.py"
  output_path = " test/greet_lambda.zip"
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": {
    "Action": "sts:AssumeRole",
    "Principal": {
      "Service": "lambda.amazonaws.com"
    },
    "Effect": "Allow"
  }
}
POLICY
}

resource "aws_lambda_function" "greet_function" {
  function_name = "greet_function"
  filename      = "${data.archive_file.sample_function.output_path}"
  runtime       = "python3.8"
  role          = "${aws_iam_role.iam_for_lambda.arn}"
  handler       = "greet_lambda.lambda_handler"
  environment {
		variables = {
			greeting = "Hi Lambda from Terraform!"
		}
	}
}

resource "aws_cloudwatch_log_group" "example" {
  name              = "/aws/lambda/greet_lambda"
  retention_in_days = 14
}

resource "aws_iam_policy" "lambda_logging" {
  name        = "lambda_logging"
  path        = "/"
  description = "IAM policy for logging from a lambda"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*",
      "Effect": "Allow"
    }
  ]
}
EOF

}


resource "aws_lambda_permission" "allow_cloudwatch" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.greet_function.function_name}"
  principal     = "events.amazonaws.com"
  source_arn    = "arn:aws:events:eu-west-1:276497045300:rule/RunDaily"
  qualifier     = "${aws_lambda_alias.greet_alias.name}"
}

resource "aws_lambda_alias" "greet_alias" {
  name             = "greetalias"
  description      = "a sample description"
  function_name    = "${aws_lambda_function.greet_function.function_name}"
  function_version = "$LATEST"
}

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.lambda_logging.arn
}


output "result1" {
  description = "String result of Lambda execution"
  value       = "${aws_iam_role.iam_for_lambda.arn}"
}