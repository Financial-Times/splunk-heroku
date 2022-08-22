terraform {
  required_providers {
    heroku = {
      source  = "heroku/heroku"
      version = "~> 5.1.2"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.3.2"
    }
  }
}

# Get the Heroku app ID and hostname from it's unique name.
data "heroku_app" "app" {
  name = var.heroku_app_name
}

# Generate a random UUID for use as the value of the `channel` URL parameter.
# See https://docs.splunk.com/Documentation/Splunk/9.0.0/Data/FormateventsforHTTPEventCollector#Channel_identifier_header for more information.
resource "random_uuid" "splunk_hec_channel" {}

# Configure the log drain resource.
#
# Uses basic authentication to avoid passing the Splunk HEC token as a URL parameter.
#
# See https://docs.splunk.com/Documentation/Splunk/9.0.0/Data/HECExamples#Example_4:_Send_multiple_raw_text_events_to_HEC for more information on the supported URL parameters.
resource "heroku_drain" "splunk_log_drain" {
  app_id        = heroku_app.app.id
  sensitive_url = "https://x:${var.splunk_hec_token}@${var.splunk_host}/services/collector/raw/1.0?%{ if var.source }source=${urlencode(var.source)}&%{ endif }host=${urlencode(heroku_app.app.heroku_hostname)}&channel=${random_uuid.splunk_hec_channel.id}"
}
