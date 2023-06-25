# User
resource "aws_iam_user" "terraform_gh" {
  name = "terraform-lab"
  path = "/systems/"

  tags = {
    owner   = var.team_name
    service = var.service_name
  }
}

# resource "aws_iam_access_key" "lab" {
#   user = aws_iam_user.terraform_gh.name
# }

# resource "aws_iam_user_policy" "lb_ro" {
#   name   = "terraform_policy_tf_lab"
#   user   = aws_iam_user.terraform_gh.name
#   policy = data.aws_iam_policy_document.lb_ro.json
# }

# resource "aws_iam_user_policy" "lb_ro" {
#   name   = "terraform_policy_tf_lab"
#   user   = aws_iam_user.terraform_gh.name
#   policy = data.aws_iam_policy_document.s3_access.json
# }

resource "aws_iam_user_policy" "extended_policy" {
  name   = "terraform_policy_tf_lab"
  user   = aws_iam_user.terraform_gh.name
  policy = data.aws_iam_policy_document.extended_policy.json
}

# output "secret_access_key" {
#   value = aws_iam_access_key.lab.secret
# }
