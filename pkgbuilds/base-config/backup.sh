#!/bin/sh
rsync --quiet -a --numeric-ids --delete -e ssh /var/lib/grafana/* server@camus:/volume2/linux/grafana/
rsync --quiet -a --numeric-ids --delete -e ssh /var/lib/prometheus/* server@camus:/volume2/linux/prometheus/
rsync --quiet -a --numeric-ids --delete -e ssh /var/lib/postgres/* server@camus:/volume2/linux/postgres/