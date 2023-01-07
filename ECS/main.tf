resource "aws_ecs_cluster" "my-cluster" {
  name = "ecs-cluster"
    
  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

