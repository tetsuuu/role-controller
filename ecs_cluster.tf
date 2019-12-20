resource "aws_ecs_cluster" "njss3_ops" {
  name = "${var.service_name}-${var.short_env}-ops"
}

resource "aws_iam_role" "task_definitions_execution" {
  name = "${var.service_name}-${var.short_env}-ops-execution-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "taskDefinitionsPolicy",
      "Effect": "Allow",
      "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "task_definitions_execution" {
  name = "${var.service_name}-${var.short_env}-ops-execution-policy"
  description = "${var.service_name} ${var.short_env}  ops shell policy on ECS Fargate"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "events:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "task_definitions_execution" {
  role       = aws_iam_role.task_definitions_execution.name
  policy_arn = aws_iam_policy.task_definitions_execution.arn
}
