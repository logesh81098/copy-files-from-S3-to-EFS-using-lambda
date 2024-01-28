#############################################################################################################
#                                  Creating lambda function
#############################################################################################################
resource "aws_lambda_function" "copy-lambda" {
  function_name = "copy-lambda"
  runtime = "python3.8"
  role = var.iam-role
  filename = "module/lambda/copy-lambda.zip"
  timeout = "20"
  handler = "copy-lambda.lambda_handler"
  file_system_config {
    arn = var.access-point-arn
    local_mount_path = "/mnt/efs"
  }
  vpc_config {
    subnet_ids = [var.public-subnet-1-id, var.public-subnet-2-id, var.public-subnet-3-id]
    security_group_ids = [var.efs-sg]
  }
    tags = {
    Name = "copy-lambda"
  }
}

#############################################################################################################
#                                  Archive lambda code
#############################################################################################################

data "archive_file" "code-zip" {
  type = "zip"
  source_dir = "module/lambda"
  output_path = "module/lambda/copy-lambda.zip"
}


#############################################################################################################
#                                 Adding Invoke Permission
#############################################################################################################
resource "aws_lambda_permission" "invoke-permission-lambda" {
  statement_id = "s3invokelambda"
  action = "lambda:InvokeFunction"
  principal = "s3.amazonaws.com"
  function_name = aws_lambda_function.copy-lambda.function_name
  source_arn = var.bucket-arn
}
