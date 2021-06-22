#!/bin/sh

/opt/jboss/keycloak/bin/add-user.sh jmxuser password

/opt/jboss/tools/docker-entrypoint.sh
