resource "aws_kms_key" "kms-key" {
  description = "my-key"
}

resource "aws_codeartifact_domain" "codeartifact" {
  domain         = "mydomain"
  encryption_key = aws_kms_key.kms-key.arn
}

resource "aws_codeartifact_repository" "test" {
  repository = "codeartifact"
  domain     = aws_codeartifact_domain.codeartifact.domain
}