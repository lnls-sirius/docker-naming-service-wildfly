#!/usr/bin/env bash

set -a
set -e
set -u

# Source env vars
. ./env-vars.sh

# Download prereqs
./download-pre-reqs.sh

# Build image
./build.sh ${POSTGRES_VERSION}

# Create docker network
./create-net.sh ${NET_NAME}

# Run postgres
./run-wildfly.sh ${NET_NAME} ${DNS_IP} ${WILDFLY_PORT} ${LOCAL_WILDFLY_PORT} \
    ${ADMIN_PORT} ${LOCAL_ADMIN_PORT}
