#! /bin/bash

source ./.env
cqlsh -b "$ASTRA_DB_SECURE_BUNDLE_PATH" -u token -p "$ASTRA_DB_APPLICATION_TOKEN" -k "$ASTRA_DB_KEYSPACE"

