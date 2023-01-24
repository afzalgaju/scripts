resource "aws_cloudwatch_metric_alarm" "cloudwatch_alarm" {
  alarm_name          = "cw-alarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  threshold           = "70"
  alarm_description   = "This alarm will trigger if the average CPU utilization of the specified instance exceeds 70% for 1 minute"
  alarm_actions       = [aws_sns_topic.sns_topic.arn]
  dimensions = {
    InstanceId = aws_instance.my-ec2.id
  }
}
resource "aws_instance" "my-ec2" {
  ami           = var.ami-id
  instance_type = var.instance-type
}
resource "aws_sns_topic" "sns_topic" {
  name = var.sns_topic
}