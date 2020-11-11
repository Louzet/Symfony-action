#!/bin/sh -l

## Create database step
# search for an .env or .env.dist file
[ -z "$ENV_FILE" ] && echo "Missing .env or .env.dist file" && exit 1

grep DATABASE_URL= > DATABASE_URL < "$ENV_FILE"
echo "$DATABASE_URL";