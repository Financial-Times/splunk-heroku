TMPDIR := $(shell mktemp -d)

.PHONY: clean

# Splunk expects specific file and folder permissions that are
# lost when using `git archive`, use `tar czf` to preserve permissions
splunk_heroku_log_drain-latest.tar.gz: $(wildcard default/*.conf) $(wildcard metadata/*.conf)
	tar -czf $(TMPDIR)/splunk_heroku_log_drain-latest.tar.gz default/ metadata/
	mv $(TMPDIR)/splunk_heroku_log_drain-latest.tar.gz .

clean:
	rm splunk_heroku_log_drain-latest.tar.gz
