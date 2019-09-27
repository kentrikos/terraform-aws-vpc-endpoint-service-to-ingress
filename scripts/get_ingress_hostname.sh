#!/bin/bash
#
# This script get hostname for specific app in namespace from kubectl
#

# Exit if any of the intermediate steps fail
set -e

# Extract "NAMESPACE" and "APP" argument from the input into
# NAMESPACE and APP shell variables.
# jq will ensure that the values are properly quoted
# and escaped for consumption by the shell.
eval "$(jq -r '@sh "NAMESPACE=\(.namespace) APP=\(.app)"')"

# Placeholder for whatever data-fetching logic your script implements
HOSTNAME=`kubectl get -n  ${NAMESPACE}  services -l app=${APP} -o jsonpath="{.items[0].status.loadBalancer.ingress[0].hostname}"`

# Safely produce a JSON object containing the result value.
# jq will ensure that the value is properly quoted
# and escaped to produce a valid JSON string.
jq -n --arg hostname "$HOSTNAME" '{"hostname":$hostname}'
