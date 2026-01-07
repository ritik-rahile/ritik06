provider "aws" {
  region = "ap-southeast-2"
}

# IAM Group
resource "aws_iam_group" "rrr" {
  name = "RRR"
}

# IAM Users
resource "aws_iam_user" "user1" {
  name = "ritik"
}

resource "aws_iam_user" "user2" {
  name = "ritik2"
}

# Group Membership
resource "aws_iam_group_membership" "rrr_membership" {
  name = "rrr-membership"

  users = [
    aws_iam_user.user1.name,
    aws_iam_user.user2.name
  ]

  group = aws_iam_group.rrr.name
}

# Attach EC2 Full Access policy
resource "aws_iam_group_policy_attachment" "ec2_full_access" {
  group      = aws_iam_group.rrr.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}
