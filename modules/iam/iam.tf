resource "aws_iam_user" "terraform_gh" {
  name = "terraform-lab"
  path = "/systems/"

  tags = {
    tag-key = format("%s-%s.%s.", var.team_name, var.service_name, var.env)
  }
}

resource "aws_iam_access_key" "lab" {
  user = aws_iam_user.terraform_gh.name
}

data "aws_iam_policy_document" "lb_ro" {
  statement {
    effect    = "Allow"
    actions   = ["ec2:Describe*"]
    resources = ["*"]
  }
}

resource "aws_iam_user_policy" "lb_ro" {
  name   = "test"
  user   = aws_iam_user.terraform_gh.name
  policy = data.aws_iam_policy_document.lb_ro.json
}

