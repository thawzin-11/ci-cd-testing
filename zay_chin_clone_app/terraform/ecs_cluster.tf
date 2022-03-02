resource "aws_ecs_cluster" "main" {
  name = "zaywal-ecs-cluster"
}

resource "aws_ecs_task_definition" "db" {
  network_mode              = "awsvpc"
  family                    = "zaywaldb"
  requires_compatibilities  = [ "FARGATE" ]
  cpu                       = "256"
  memory                    = "512"
  execution_role_arn        = "arn:aws:iam::180127513132:role/ecsTaskExecutionRole"
  container_definitions     = jsonencode([
    {
      name  = "mongodb-container"
      image = "mongo:5.0.2"
      portMappings  = [
        {
          hostPort = 27017
          containerPort = 27017
        }
     ]
      environment = [
        {
          name  = "MONGO_INITDB_ROOT_PASSWORD"
          value = "example"
        },
        {
          name  = "MONGO_INITDB_ROOT_USERNAME"
          value = "root"
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group = "/ecs/zaywaldb"
          awslogs-region  = "ap-southeast-1"
          awslogs-stream-prefix  = "ecs"
        }
      }     
    }
  ])
}

resource "aws_ecs_task_definition" "api" {
  network_mode              = "awsvpc"
  family                    = "zaywal-api"
  requires_compatibilities  = [ "FARGATE" ]
  cpu                       = "256"
  memory                    = "512"
  execution_role_arn        = "arn:aws:iam::180127513132:role/ecsTaskExecutionRole"
  container_definitions     = jsonencode([
    {
      name  = "api-server-container"
      image = "180127513132.dkr.ecr.ap-southeast-1.amazonaws.com/api-server:f5159522505d00d59bf5d8a463676b3614bda2e8"
      portMappings  = [
        {
          hostPort      = 4000
          containerPort = 4000
        }
      ]
      environment = [
        {
          name = "DB_HOST"
          value = "db.zaywal-terraform.com"
        },
        {
          "name": "DB_NAME",
          "value": "zaywal-db"
        },
        {
          "name": "DB_PASS",
          "value": "example"
        },
        {
          "name": "DB_PORT",
          "value": "27017"
        },
        {
          "name": "DB_USER",
          "value": "root"
        },
        {
          "name": "HOST_NAME",
          "value": "zaywalapiserver"
        }
      ]
      logConfiguration = {
       logDriver = "awslogs"
       options = {
        awslogs-group = "/ecs/zaywalapi"
        awslogs-region  = "ap-southeast-1"
        awslogs-stream-prefix  = "ecs"
        }
      }     
    }
  ])
}

resource "aws_ecs_task_definition" "admin" {
  network_mode              = "awsvpc"
  family                    = "zaywal-admin-panel"
  requires_compatibilities  = [ "FARGATE" ]
  cpu                       = "256"
  memory                    = "512"
  execution_role_arn        = "arn:aws:iam::180127513132:role/ecsTaskExecutionRole"
  container_definitions     = jsonencode([
    {
      name  = "admin-panel-container"
      image = "180127513132.dkr.ecr.ap-southeast-1.amazonaws.com/zaywal-admin-panel:f5159522505d00d59bf5d8a463676b3614bda2e8"
      portMappings  = [
        {
          hostPort      = 80
          containerPort = 80
        }
      ]
      logConfiguration = {
       logDriver = "awslogs"
       options = {
          awslogs-group = "/ecs/zaywaladmin"
          awslogs-region  = "ap-southeast-1"
          awslogs-stream-prefix  = "ecs"
        }
      }     
    }
  ])
}