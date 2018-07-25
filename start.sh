#!/bin/bash
set -e

# Apache gets grumpy about PID files pre-existing
rm -f /data/httpd/run/httpd.pid

exec httpd -f /dispatcher/httpd/httpd.conf -DFOREGROUND
