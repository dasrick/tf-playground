locals {
  lambda_name_one = "${local.name_prefix}-one"
}

resource "aws_lambda_function" "one" {
  s3_bucket     = "${var.s3-artifacts}"
  s3_key        = "${local.s3_key_golang_playground}one.zip"
  function_name = "${local.lambda_name_one}"
  role          = "${aws_iam_role.lambda_one.arn}"
  handler       = "one"
  runtime       = "go1.x"

  tags = "${merge(local.common_tags, map(
    "Name", format("%s", local.lambda_name_one)
  ))}"
}
