#!/bin/sh -l

# Function to log result of a operation.
add_log() {
    
    gender=$1
    message=$2

    if [ "$gender" = "info" ]; then

        printf "\033[34;1m%s \033[0m\033[90;1m%s\033[0m\n" "$gender": "$message"

    elif [ "$gender" = "error" ]; then

        printf "\033[31;1m%s \033[0m\033[90;1m%s\033[0m\n" "$gender": "$message" && exit 1

    fi
}

## validate DATABASE_URL
validate_database_url() {

    env_file=$1

    [ -z "$env_file" ] && add_log "error" "Missing .env or .env.dist file" && exit 1

    grep DATABASE_URL= > DATABASE_URL < "$env_file"

    [ -z "$DATABASE_URL" ] && add_log "error" "DATABASE_URL variable was not found"

}

## variables
ENV_FILE=$1

if [ -z "$ENV_FILE" ];then

    add_log "error" "Missing .env or .env.dist file"

else
    add_log "info" "The $ENV_FILE file successfully was found !"

    cat "$ENV_FILE";

    validate_database_url "$ENV_FILE"
fi
## Create database step
# search for an .env or .env.dist file
# [ -z "$ENV_FILE" ] && echo "Missing .env or .env.dist file" && exit 1

# grep DATABASE_URL= > DATABASE_URL < "$ENV_FILE"
# echo "$DATABASE_URL";