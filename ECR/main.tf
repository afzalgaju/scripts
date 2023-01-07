resource "aws_ecr_repository" "my-container" {
  name = "ecr-repository"

  image_scanning_configuration {
    scan_on_push = true
  }
  
}
