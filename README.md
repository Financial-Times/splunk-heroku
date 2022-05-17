# Splunk Heroku Log Drain Add-on

A Heroku log drain source type packaged as a Splunk Add-on, based on [RFC5424](https://datatracker.ietf.org/doc/html/rfc5424).

## Releasing

[Create a new release in GitHub](https://docs.github.com/en/repositories/releasing-projects-on-github/managing-releases-in-a-repository#creating-a-release) to trigger a workflow that updates `splunk_heroku_log_drain-latest.tar.gz`. [This file can be installed on Splunk.](https://docs.splunk.com/Documentation/SplunkCloud/latest/Admin/PrivateApps)

The version number in `default/app.conf` will automatically be updated in the default branch to match the release.

## Links

* https://devcenter.heroku.com/articles/log-drains#https-drains
* https://dev.splunk.com/enterprise/docs/releaseapps/packageapps/packagingtoolkit/
