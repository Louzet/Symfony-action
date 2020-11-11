#!/bin/sh -l

ENV_FILE=$1

if [ -z "$ENV_FILE" ];
then
    echo "Missing .env or .env.dist file" && exit 1
else
    add_log "info" "The $ENV_FILE was found !"
    cat "$ENV_FILE";

    validate_database_url "$ENV_FILE"
fi
## Create database step
# search for an .env or .env.dist file
# [ -z "$ENV_FILE" ] && echo "Missing .env or .env.dist file" && exit 1

# grep DATABASE_URL= > DATABASE_URL < "$ENV_FILE"
# echo "$DATABASE_URL";

## validate DATABASE_URL
validate_database_url() {
    env_file=$1

    [ -z "$env_file" ] && echo "Missing .env or .env.dist file" && exit 1

    grep DATABASE_URL= > DATABASE_URL < "$env_file"
    [ -z "$DATABASE_URL" ] && echo "DATABASE_URL variable was not found" && exit 1
}

# Function to log result of a operation.
add_log() {
    gender=$1
    message=$2

    printf "\033[34;1m%s \033[0m\033[90;1m%s\033[0m\n" "$gender": "$message"
}