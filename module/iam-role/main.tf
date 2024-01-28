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

#############################################################################################################
#                                         Creating IAM policy
#############################################################################################################
resource "aws_iam_policy" "s3-to-efs-policy" {
  name = "s3-to-efs-policy"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "lambdavpcacces",
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "ec2:CreateNetworkInterface",
        "ec2:DescribeNetworkInterfaces",
        "ec2:DescribeSubnets",
        "ec2:DeleteNetworkInterface",
        "ec2:AssignPrivateIpAddresses",
        "ec2:UnassignPrivateIpAddresses"
      ],
      "Resource": "*"
    },
    {
      "Sid": "lambdaexecutionpolicy",
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "s3-object-lambda:WriteGetObjectResponse"
      ],
      "Resource": "*"
    },
    {
      "Sid": "s3bucketlist",
      "Effect": "Allow",
      "Action": [
        "s3:ListBucket",
        "s3:PutObject",
        "s3:GetObject"
      ],
      "Resource": [
        "arn:aws:s3:::*",
        "arn:aws:s3:::*/*"
      ]
    },
    {
      "Sid": "efsaccess",
      "Effect": "Allow",
      "Action": [
        "elasticfilesystem:ClientWrite",
        "elasticfilesystem:ClientRootAccess",
        "elasticfilesystem:DescribeFileSystems",
        "elasticfilesystem:ClientRead",
        "elasticfilesystem:DescribeMountTargets"
      ],
      "Resource": "*"
    },
    {
      "Sid": "invokelambda",
      "Effect": "Allow",
      "Action": [
        "lambda:InvokeFunction"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}  


#############################################################################################################
#                                  Attaching Policy with Role
#############################################################################################################
resource "aws_iam_role_policy_attachment" "role-policy-attachment" {
  policy_arn = aws_iam_policy.s3-to-efs-policy.arn
  role = aws_iam_role.s3-to-efs-role.id
}
