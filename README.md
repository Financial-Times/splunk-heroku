# Heroku Splunk App

Support for Heroku log drains packaged as a Splunk App, based on [RFC5424](https://datatracker.ietf.org/doc/html/rfc5424).

## Releasing

[Create a release in GitHub](https://docs.github.com/en/repositories/releasing-projects-on-github/managing-releases-in-a-repository#creating-a-release) to trigger a workflow that builds and uploads an package to the [GitHub release assets](/releases), e.g. `splunk_heroku-1.0.8.tar.gz`. [This file can be installed on Splunk.](https://docs.splunk.com/Documentation/SplunkCloud/latest/Admin/PrivateApps)

The version number in `app/default/app.conf` will automatically be updated in the default branch to match the release via a pull request.

## Links

* https://devcenter.heroku.com/articles/log-drains#https-drains
* https://dev.splunk.com/enterprise/docs/releaseapps/packageapps/packagingtoolkit/
