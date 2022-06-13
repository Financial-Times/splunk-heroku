TMPDIR := $(shell mktemp -d)

.PHONY: clean

latest: splunk_heroku-latest.tar.gz

# Splunk expects specific file and folder permissions that are
# lost when using `git archive`, use `tar` to preserve permissions
#
# The tar directory structure must include a base directory named
# after the app ID in app.conf.
splunk_heroku-%.tar.gz: $(wildcard app/default/*.conf) $(wildcard app/lookups/*.csv) $(wildcard app/metadata/*.meta)
	mkdir -p $(TMPDIR)/splunk_heroku/
	cp -r app/* $(TMPDIR)/splunk_heroku/
	tar -C $(TMPDIR) -czf $(TMPDIR)/$@ splunk_heroku/
	mv $(TMPDIR)/$@ .

clean:
	rm -f splunk_heroku-*.tar.gz
