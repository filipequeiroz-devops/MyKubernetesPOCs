
resource "aws_iam_role" "EC2_Role" {
  name = "EC2_Role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

#Allow EC2 instances to have full access to S3
resource "aws_iam_role_policy_attachment" "S3FullAccess" {
  role       = aws_iam_role.EC2_Role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
