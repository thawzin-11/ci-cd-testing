resource "aws_ecs_service" "db" {
 name = "db_service"
 cluster = aws_ecs_cluster.main.id
 task_definition = aws_ecs_task_definition.db.arn
 desired_count = 1
 launch_type = "FARGATE"
#  platform_version = "latest"

 network_configuration {
   subnets = [ for subnet in aws_subnet.private : subnet.id ]
   security_groups = [ aws_security_group.db.id ]
   assign_public_ip = true
 }
 service_registries {
   registry_arn = aws_service_discovery_service.db.arn
   container_name = "mongodb-container"
 }
}

resource "aws_ecs_service" "api" {
 name = "api_service"
 cluster = aws_ecs_cluster.main.id
 task_definition = aws_ecs_task_definition.api.arn
 desired_count = 1
 launch_type = "FARGATE"
#  platform_version = "latest"

 network_configuration {
   subnets = [ for subnet in aws_subnet.private : subnet.id ]
   security_groups = [ aws_security_group.api.id ]
   assign_public_ip = true
 }

 load_balancer {
   container_name = "api-server-container"
   container_port = 4000
   target_group_arn = aws_lb_target_group.api.arn
 }

 service_registries {
   registry_arn = aws_service_discovery_service.api.arn
   container_name = "api-server-container"
 }
}

resource "aws_ecs_service" "admin" {
 name = "admin_panel_service"
 cluster = aws_ecs_cluster.main.id
 task_definition = aws_ecs_task_definition.admin.arn
 desired_count = 1
 launch_type = "FARGATE"
#  platform_version = "latest"


 network_configuration {
   subnets = [ for subnet in aws_subnet.public : subnet.id ]
   security_groups = [ aws_security_group.admin.id ]
   assign_public_ip = true
 }

 load_balancer {
   container_name = "admin-panel-container"
   container_port = 80
   target_group_arn = aws_lb_target_group.admin.arn
 }
}