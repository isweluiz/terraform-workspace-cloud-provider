# data "aws_iam_policy_document" "lb_ro" {
#   statement {
#     effect    = "Allow"
#     actions   = ["ec2:Describe*"]
#     resources = ["*"]
#   }
# }

# data "aws_iam_policy_document" "s3_access" {
#   statement {
#     effect    = "Allow"
#     actions   = ["s3:*"]
#     resources = ["*"]
#   }
# }

data "aws_iam_policy_document" "extended_policy" {
  statement {
    effect = "Allow"
    actions = [
      "s3:*",
      "ec2:*",
      "ecs:*",
      "eks:*",
      "comprehend:*",
      "translate:*",
      "transcribe:*"
    ]
    resources = ["*"]
  }
}
