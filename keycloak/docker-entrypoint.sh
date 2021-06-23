#!/bin/sh

set -x

/opt/jboss/keycloak/bin/add-user.sh jmxuser password

exec /opt/jboss/tools/docker-entrypoint.sh
