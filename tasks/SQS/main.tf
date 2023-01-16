
resource "aws_sqs_queue" "my_queue" {
  name                        = "terraform-queue.fifo"
  fifo_queue                  = true
  content_based_deduplication = true
}