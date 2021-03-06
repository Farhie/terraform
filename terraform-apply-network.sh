#!/usr/bin/env bash

set -e

[ -z "$1" ] && echo "environment argument missing (e.g development)" && exit 1

ENVIRONMENT="$1"

rm -rf .terraform
cd infrastructure/network
terraform apply -var-file=../../environment/${ENVIRONMENT}/${ENVIRONMENT}.tfvars