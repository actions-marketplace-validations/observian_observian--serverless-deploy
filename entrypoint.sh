#!/bin/bash
set -e

function main() {
    echo "validating inputs"
    validate "${INPUT_ACCESS_KEY_ID}" "access_key_id"
    validate "${INPUT_SECRET_ACCESS_KEY}" "secret_access_key"
    validate "${INPUT_REGION}" "region"
    validate "${INPUT_ACCOUNT_ID}" "account_id"
    validate "${INPUT_EKS_CLUSTER_NAME}" "eks_cluster_name"

    echo "inputs are valid"
    echo "setting up env variables for the build"
    export AWS_ACCESS_KEY_ID=$INPUT_ACCESS_KEY_ID
    export AWS_SECRET_ACCESS_KEY=$INPUT_SECRET_ACCESS_KEY
    export AWS_DEFAULT_REGION=$INPUT_REGION
    echo "done"

    local PLUGIN=$INPUT_PLUGINS
    local plugins=""
    local PLUGINS=$(echo "$PLUGIN" | tr "," "\n")

    for plugin in $PLUGINS; do
        echo "installing $plugin"
        npm install $plugin
        echo "$done"
    done

    serverless deploy
}

function validate() {
    if [ -z "${1}" ]; then
        >&2 echo "can't find ${2}.  Please make sure ${2} is set"
        exit 1
    fi
}
main
