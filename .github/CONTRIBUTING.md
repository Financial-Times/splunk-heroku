# Contributing

Thanks for looking to make a contribution!

Working on a Splunk app might be a bit different to what you'd usually expect, we don't have a unit test suite for example.

To verify your changes, we suggest using one of the following methods to support a pull request:

1. Use [regex101](https://regex101.com/)
2. Configure a local Splunk environment

Screenshots and regex101 links will be appreciated in any pull request description.

## Use regex101

Smaller contributions that add or modify a field extraction, using a tool such as [regex101](https://regex101.com/) should provide enough feedback to raise the change with confidence.

Add the field extraction regex and some example logs, using named capture groups (e.g. `(?<field_name>.+)`) to confirm the extraction will work as expected.

Check out https://regex101.com/r/4fjIZl/1 as an example, which was used to verify the addition of the `state` field in [#34](https://github.com/Financial-Times/splunk-heroku/pull/34).

## Configure a local Splunk environment

For larger changes set yourself up with a local developer environment.

While Splunk provide Docker images, they don't yet work with Apple Silicone based machines.

### Installing Splunk

Download and install Splunk locally.

1. [Register for a Splunk.com account](https://www.splunk.com/page/sign_up)
2. [Download and install Splunk Enterprise](https://www.splunk.com/en_us/download/splunk-enterprise.html?locale=en_us)

### Building and installing the Splunk app

1. Build the Splunk app using `make splunk_heroku-latest.tar.gz`
2. Install or upgrade the Splunk app locally by visiting http://localhost:8000/en-GB/manager/appinstall/_upload

You can also use the Splunk CLI to install or update the app:

```
/Applications/Splunk/bin/splunk install app splunk_heroku-latest.tar.gz -update 1
```

### Sending logs to the HEC

You can recreate Heroku logplex sending logs to the Splunk HEC using the following curl command.

Ensure your Splunk HEC token has the default source type set to `heroku_requests`.

```shell
curl --user "x:$SPLUNK_HEC_TOKEN" --header 'Content-Type: application/logplex-1' 'http://localhost:8088/services/collector/raw?channel=123e4567-e89b-12d3-a456-426614174000' < logs.txt
```

Create a file called `logs.txt` containing your example logs. This should match the raw [syslog message structure used by Heroku log drains](https://devcenter.heroku.com/articles/log-drains#https-drains). For example, here are some Heroku system logs:

```
300 <158>1 2022-06-27T11:04:23.307185+00:00 host heroku logplex - Error L10 (output buffer overflow): 1 messages dropped since 2022-06-27T11:04:23.261691+00:00.
300 <158>1 2022-06-27T10:47:10.956921+00:00 host heroku web.1 - State changed from starting to up
300 <158>1 2022-06-27T10:47:06.981137+00:00 host heroku web.1 - Starting process with command `node dist/server/index.js`
300 <158>1 2022-06-27T10:46:57.055996+00:00 host heroku web.1 - Stopping all processes with SIGTERM
300 <158>1 2022-06-27T10:46:57.357378+00:00 host heroku web.1 - Process exited with status 0
300 <158>1 2022-06-26T23:32:05.979915+00:00 host heroku web.1 - Cycling
300 <158>1 2022-06-26T18:22:48.719893+00:00 host heroku worker.1 - Starting process with command `node dist/file-feed-worker.js`
300 <158>1 2022-06-26T00:00:23.415949+00:00 host heroku scheduler.2891 - Starting process with command `node dist/cron.js`
300 <158>1 2022-06-26T00:00:23.999033+00:00 host heroku scheduler.2891 - State changed from starting to up
300 <158>1 2022-06-26T03:52:39.943758+00:00 host heroku scheduler.2891 - Process exited with status 0
300 <158>1 2022-06-26T03:52:40.07917+00:00 host heroku scheduler.2891 - State changed from up to complete
```
