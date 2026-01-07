# IAM Group
resource "aws_iam_group" "rrr" {
  name = var.group_name
}

# IAM Users
resource "aws_iam_user" "users" {
  for_each = toset(var.user_names)
  name     = each.value
}

# Add users to group
resource "aws_iam_group_membership" "rrr_membership" {
  name  = "rrr-group-membership"
  users = [for user in aws_iam_user.users : user.name]
  group = aws_iam_group.rrr.name
}

# Attach EC2 Full Access policy to group
resource "aws_iam_group_policy_attachment" "ec2_full_access" {
  group      = aws_iam_group.rrr.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}
