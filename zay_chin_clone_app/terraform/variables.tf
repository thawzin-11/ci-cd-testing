variable "aws_region" {
  default = "ap-southeast-1"
}

variable "ecs_task_execution_role_name" {
  default = "myEcsTaskExecutionRole"
}

variable "az_count" {
  default     = 2
}

variable "mongo_image" {
  description = "Docker image to run in the ECS cluster"
  default     = "mongo:5.0.2"
}

variable "api_server_image" {
  description = "Docker image to run in the ECS cluster"
  default     = "180127513132.dkr.ecr.ap-southeast-1.amazonaws.com/api-server"
}

variable "admin_panel_image" {
  default = "180127513132.dkr.ecr.ap-southeast-1.amazonaws.com/zaywal-admin-panel"
}

variable "mongo_port" {
  default = 27017
}

variable "api_port" {
  default = 4000
}

variable "admin_port" {
  default = 80
}

variable "health_check_path" {
  default = "/.well-known/apollo/server-health"
}

variable "fargate_cpu" {
  default = 256
}

variable "fargate_memory" {
  default = 512
}

variable "vpc_cidr" {
	default = "10.0.0.0/16"
}

variable "private_subnets_cidr" {
	type = list
	default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "public_subnets_cidr" {
	type = list
	default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "azs" {
  type = list
  default = ["ap-southeast-1a", "ap-southeast-1b"]
}
