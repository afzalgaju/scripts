resource "aws_codestarconnections_host" "codestar" {
  name              = "codestar"
  provider_endpoint = "https://example.com"
  provider_type     = "GitHubEnterpriseServer"
}