# Output the same values as a heroku_drain resource.
# See https://registry.terraform.io/providers/heroku/heroku/latest/docs/resources/drain#attributes-reference for more information.
output "token" {
  value = heroku_drain.splunk_log_drain.token
  description = "The unique token for your created drain."
}
