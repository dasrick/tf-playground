resource "aws_cloudwatch_log_group" "lambda_one" {
  depends_on = ["aws_lambda_function.one"]
  name       = "/aws/lambda/${aws_lambda_function.one.function_name}"
}
