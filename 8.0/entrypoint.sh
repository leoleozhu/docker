#!/bin/bash

set -e

# set odoo database host, port, user and password
: ${PGHOST:=$POSTGRESQL_PORT_5432_TCP_ADDR}
: ${PGPORT:=$POSTGRESQL_PORT_5432_TCP_PORT}
: ${PGUSER:=${POSTGRESQL_USERNAME:='postgres'}}
: ${PGPASSWORD:=$POSTGRESQL_PASSWORD}
export PGHOST PGPORT PGUSER PGPASSWORD

case "$1" in
	--)
		shift
		exec openerp-server "$@"
		;;
	-*)
		exec openerp-server "$@"
		;;
	*)
		exec "$@"
esac

exit 1
