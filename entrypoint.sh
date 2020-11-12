#!/bin/sh -l

# Function to log result of a operation.
add_log() {

    gender=$1
    message=$2

    tick="✓"
    cross="✗"

    if [ "$gender" = "success" ]; then

        mark="$tick"
        printf "\033[32;1m%s \033[0m\033[34;1m%s \033[0m\033[90;1m%s\033[0m\n" "$mark" "$gender": "$message"

    elif [ "$gender" = "error" ]; then

        mark="$cross"
        printf "\033[31;1m%s \033[0m\033[34;1m%s \033[0m\033[90;1m%s\033[0m\n" "$mark" "$gender" "$message" && exit 1

    fi
}

## extract database_name
extract_database_name() {
    env_file=$1

    grep DATABASE_URL= > DATABASE_URL < "$env_file"
    printf "%s" "$DATABSE_URL"
    ##[ -z "$DATABASE_URL" ] && add_log "error" "DATABASE_URL variable was not found \n"

    STRLENGTH=$(echo "%s" "$DATABASE_URL" | wc -c)
    len=$(("$STRLENGTH" + 0))

    printf "length of the dsn of the database: %s \n" "$len"

    # if [ $(("$len" > 0)) ]; then
    #     while IFS='/' read -ra DATABASE_URL; do
    #         for part in "${ADDR[@]}"; do
    #             echo "$part"
    #         done
    #     done <<< "$IN"
    # fi
}

## validate DATABASE_URL
validate_database_url() {

    env_file=$1

    [ -z "$env_file" ] && add_log "error" "Missing .env or .env.dist file \n"

    extract_database_name "$env_file"

}

## variables
ENV_FILE=$1

## process
if [ -z "$ENV_FILE" ];then

    add_log "error" "Missing .env or .env.dist file"

else
    add_log "info" "The $ENV_FILE file successfully was found !"

    validate_database_url "$ENV_FILE"
fi
## Create database step
# search for an .env or .env.dist file
# [ -z "$ENV_FILE" ] && echo "Missing .env or .env.dist file" && exit 1

# grep DATABASE_URL= > DATABASE_URL < "$ENV_FILE"
# echo "$DATABASE_URL";