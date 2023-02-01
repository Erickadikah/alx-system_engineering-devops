#!/usr/bin/bash
# Path parameters
# Curl command
curl -X GET "https://api.datadoghq.com/api/v1/hosts" \
-H "Accept: application/json" \
-H "DD-API-KEY: ${DD_API_KEY}" \
-H "DD-APPLICATION-KEY: ${DD_APP_KEY}"
