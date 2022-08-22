# Splunk Log Drain

Configure a Heroku log drain for Splunk using Terraform. Creates a [`heroku_drain` resource](https://registry.terraform.io/providers/heroku/heroku/latest/docs/resources/drain).

## Example usage

```tf
module "splunk_log_drain" {
  source = "github.com/Financial-Times/splunk-heroku//terraform/modules/splunk_log_drain"
  splunk_source = "example"
  splunk_hec_token = "123e4567-e89b-12d3-a456-426614174000"
}
```

### Importing

When importing a Splunk Heroku log drain resource, the ID must be built using the app name colon the unique ID from the Heroku API. For an app named `example` with a log drain ID of `123e4567-e89b-12d3-a456-426614174000` and the url attribute value defined for the resource, you would import it as:

```sh
$ terraform import module.splunk_log_drain.heroku_drain.splunk_log_drain example:123e4567-e89b-12d3-a456-426614174000
```

Use [`heroku drains`](https://devcenter.heroku.com/articles/heroku-cli-commands#heroku-drains) to list the existing log drains of an app.
