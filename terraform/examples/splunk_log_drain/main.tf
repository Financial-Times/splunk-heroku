module "splunk_log_drain" {
  source              = "../../modules/splunk_log_drain"
  heroku_app_name     = "example"
  splunk_host         = "http-inputs-example.splunkcloud.com"
  splunk_event_source = "example"
  splunk_hec_token    = "123e4567-e89b-12d3-a456-426614174000"
}
