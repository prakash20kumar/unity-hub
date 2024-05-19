data "terraform_remote_state" "network" {
  backend = "local"

  config = {
    path = "../terraform.tfstate"
  }
}

resource "aws_ecs_task_definition" "mern_task" {
  family                   = "${var.app_name}-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([
    {
      name      = "backend"
      image     = "prakash20kumar/mern-backend:latest"
      essential = true
      portMappings = [
        {
          containerPort = 5000
          hostPort      = 5000
        }
      ]
      environment = [
        {
          name  = "DOCUMENTDB_URI"
          value = data.terraform_remote_state.network.outputs.documentdb_endpoint
        },
        {
          name  = "DOCUMENTDB_USERNAME"
          value = var.documentdb_username
        },
        {
          name  = "DOCUMENTDB_PASSWORD"
          value = var.documentdb_password
        }
      ]
    },
    {
      name      = "frontend"
      image     = "prakash20kumar/mern-frontend:latest"
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ])
}
