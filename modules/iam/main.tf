resource "aws_iam_role" "lambda_dynamodb_role" {
  name = var.lambda_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "dynamodb_policy_attachment" {
  name       = "lambda-dynamodb-policy-attachment"
  roles      = [aws_iam_role.lambda_dynamodb_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"

}
resource "aws_iam_policy_attachment" "s3_policy_attachment" {
  name       = "lambda-s3-policy-attachment"
  roles      = [aws_iam_role.lambda_dynamodb_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_role" "apigateway_cloudwatch_role" {
  name = var.api_gateway_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "apigateway.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "apigateway_cloudwatch_policy_attachment" {
  name       = "apigateway-cloudwatch-policy-attachment"
  roles      = [aws_iam_role.apigateway_cloudwatch_role.name]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonAPIGatewayPushToCloudWatchLogs"
}

resource "aws_iam_policy" "cloudwatch_logs_policy" {
  name   = "cloudwatch-logs-policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "logs:DescribeLogGroups",
          "logs:DescribeLogStreams",
          "logs:PutMetricFilter",
          "logs:DeleteMetricFilter",
          "logs:PutRetentionPolicy",
          "logs:DeleteRetentionPolicy",
          "logs:TagLogGroup"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "lambda_cloudwatch_logs_policy_attachment" {
  name       = "lambda-cloudwatch-logs-policy-attachment"
  roles      = [aws_iam_role.lambda_dynamodb_role.name]
  policy_arn = aws_iam_policy.cloudwatch_logs_policy.arn
}


output "lambda_dynamodb_role_arn" {
  value = aws_iam_role.lambda_dynamodb_role.arn
}
