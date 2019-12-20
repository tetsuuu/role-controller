resource "aws_ecs_cluster" "njss3_ops" {
  name = "${var.service_name}-${var.short_env}-ops"
}

resource "aws_iam_role" "task_definitions_execution" {
  name = "${var.service_name}${var.short_env}-ops-execution"

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