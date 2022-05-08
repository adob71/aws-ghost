module "lambda_function_existing_package_local" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = "delete"
  handler       = "index.handler"
  runtime       = "nodejs14.x"

  create_package         = false
  local_existing_package = "delete.zip"
}
