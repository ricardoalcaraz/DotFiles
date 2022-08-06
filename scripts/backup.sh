#!/bin/sh
rsync -a --delete --quiet -e ssh /path/to/backup remoteuser@remotehost:/location/of/backup