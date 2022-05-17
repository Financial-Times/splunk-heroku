# Splunk Heroku Log Drain Add-on

A Heroku log drain source type packaged as a Splunk Add-on, based on RFC5424.

## Releasing

[Creating a new release](https://docs.github.com/en/repositories/releasing-projects-on-github/managing-releases-in-a-repository#creating-a-release) in GitHub will trigger a workflow that packages the app and updates `splunk_heroku_log_drain-latest.tar.gz`, which can then be installed on Splunk.

The version number in `default/app.conf` will automatically be updated in the default branch to match the release.

## Links

* https://devcenter.heroku.com/articles/log-drains#https-drains
* https://datatracker.ietf.org/doc/html/rfc5424
* https://datatracker.ietf.org/doc/html/rfc6587#section-3.4.1
* https://docs.splunk.com/Documentation/SplunkCloud/8.2.2202/Admin/SelfServiceAppInstall
* https://dev.splunk.com/enterprise/docs/releaseapps/packageapps/packagingtoolkit/
