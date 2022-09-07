variable "heroku_app_name" {
  type = string
  description = "The name of the application. In Heroku, this is also the unique ID."
  nullable = false
}

variable "splunk_host" {
  type = string
  description = "The Splunk HTTP Event Collector host, e.g. http-inputs-example.splunkcloud.com or input-example.cloud.splunk.com:8089."
  nullable = false
}

variable "splunk_event_source" {
  type = string
  description = "The value to use as the `source` field in events."
}

variable "splunk_hec_token" {
  type = string
  description = "The Splunk HTTP Event Collector (HEC) token to use."
  sensitive = true
  nullable = false
}
