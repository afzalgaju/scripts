resource "aws_lb_target_group" "alb" {
  name     = "application-alb"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "attach-alb" {
  target_group_arn = aws_lb_target_group.alb.arn
  target_id        = aws_instance.arunec2.id
  port             = 80
}

resource "aws_lb" "alb" {
  name               = "alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${var.security_groups}"]
  subnets = [
    "${var.subnet1}",
    "${var.subnet2}",
  ]


  enable_deletion_protection = false

  tags = {
    Environment = "production"
  }
}

resource "aws_instance" "arunec2" {
  count = "1"

  ami           = var.ami-id
  instance_type = var.instance-type
  
  tags = {
    Name = "ec1"
  }
}
