locals {
  ops_image_url       = "${data.aws_caller_identity.self.account_id}.dkr.ecr.${var.region}.amazonaws.com/${var.service_name}-${var.short_env}-ops"
  ops_container_name  = "${var.service_name}-${var.short_env}-ops-enable"
  execution_role_arn  = "arn:aws:iam::${data.aws_caller_identity.self.account_id}:role/ecsTaskExecutionRole"
  memory = "512"
  cpu    = "256"
}

resource "aws_ecs_task_definition" "rule_enable_task" {
  family                   = "${var.service_name}-${var.short_env}-ops"
  container_definitions    = templatefile("./template/task_definitions.tmpl", { image_url = local.ops_image_url, name = "${local.ops_container_name}-enable", flag = enable })
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  execution_role_arn       = local.execution_role_arn
  task_role_arn            = aws_iam_role.task_definitions_execution.arn
  cpu                      = local.cpu
  memory                   = local.memory

  tags = {
    Name    = "${var.service_name}-${var.short_env}-ops-enable"
    Env     = var.short_env
    Region  = var.region
    Service = var.service_name
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_ecs_task_definition" "rule_disable_task" {
  family                   = "${var.service_name}-${var.short_env}-ops"
  container_definitions    = templatefile("./template/task_definitions.tmpl", { image_url = local.ops_image_url, name = "${local.ops_container_name}-disable", flag = disable })
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  execution_role_arn       = local.execution_role_arn
  task_role_arn            = aws_iam_role.task_definitions_execution.arn
  cpu                      = local.cpu
  memory                   = local.memory

  tags = {
    Name    = "${var.service_name}-${var.short_env}-ops-disable"
    Env     = var.short_env
    Region  = var.region
    Service = var.service_name
  }

  lifecycle {
    create_before_destroy = true
  }
}
