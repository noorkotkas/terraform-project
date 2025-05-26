# SNS teavitusteema
resource "aws_sns_topic" "alerts" {
  name = "${var.name}-alerts"  # Teavitusteema nimi
}

# E-posti tellija
resource "aws_sns_topic_subscription" "email_sub" {
  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = var.alert_email  # Teavituse saaja e-post
}

# CPU kasutuse alarm
resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name          = "${var.name}-HighCPU"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = var.period
  statistic           = "Average"
  threshold           = var.threshold
  alarm_description   = "Alarm kui CPU keskmine > threshold"
  dimensions = { InstanceId = var.ec2_instance_id }
  alarm_actions = [ aws_sns_topic.alerts.arn ]
}