locals {
  role_name_lambda_one = "${local.name_prefix}-one"
}

resource "aws_iam_role" "lambda_one" {
  name               = "${local.role_name_lambda_one}"
  assume_role_policy = "${file("policy/assume-role-policy-lambda.json")}"

  tags = "${merge(local.common_tags, map(
    "Name", local.role_name_lambda_one
  ))}"
}

resource "aws_iam_role_policy" "lambda_one" {
  name   = "${local.role_name_lambda_one}"
  role   = "${aws_iam_role.lambda_one.id}"
  policy = "${data.template_file.policy_lambda_one.rendered}"
}

data "template_file" "policy_lambda_one" {
  template = "${file("policy/policy-lambda-one.json")}"
}
