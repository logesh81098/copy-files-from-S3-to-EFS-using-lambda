#############################################################################################################
#                                         Creating IAM Role
#############################################################################################################
resource "aws_iam_role" "s3-to-efs-role" {
  name = "s3-to-efs-role"
  assume_role_policy = <<EOF
{
    "Version" : "2012-10-17",
    "Statement" : [
        {
            "Effect" : "Allow",
            "Principal" : {
                "Service" : "lambda.amazonaws.com"
            },
            "Action" : "sts:AssumeRole"
        }
    ]
}  
EOF
}

