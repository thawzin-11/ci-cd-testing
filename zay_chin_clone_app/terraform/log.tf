resource "aws_cloudwatch_log_group" "db_log_group" {
 name = "/ecs/db"
 retention_in_days = 30

 tags = {
  Name = "db_log_group"
 }
}

resource "aws_cloudwatch_log_stream" "db_log_stream" {
  name = "db_log_stream"
  log_group_name = aws_cloudwatch_log_group.db_log_group.name
}

resource "aws_cloudwatch_log_group" "api_log_group" {
 name = "/ecs/api"
 retention_in_days = 30

 tags = {
  Name = "api_log_group"
 }
}

resource "aws_cloudwatch_log_stream" "api_log_stream" {
  name = "api_log_stream"
  log_group_name = aws_cloudwatch_log_group.api_log_group.name
}

resource "aws_cloudwatch_log_group" "admin_log_group" {
 name = "/ecs/admin"
 retention_in_days = 30

 tags = {
  Name = "admin_log_group"
 }
}

resource "aws_cloudwatch_log_stream" "admin_log_stream" {
  name = "admin_log_stream"
  log_group_name = aws_cloudwatch_log_group.admin_log_group.name
}