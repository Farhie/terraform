#!/usr/bin/env python3
import argparse
import os
import subprocess
import traceback

import boto3
import sys
from botocore.exceptions import ClientError

STATE_BUCKET_NAME = 'farhie-terraform-state-bucket'


def navigate_to(dir):
    os.chdir(dir)


def generate_state_file_name(environment, infra_target):
    return "{}-{}.tfstate".format(environment, infra_target)


def generate_bucket_name(environment):
    return '{}-{}'.format(environment, STATE_BUCKET_NAME)


def generate_terraform_vars_file_input_string_for(environment):
    relative_path_to_var_files = "variables/{}/".format(environment)
    variable_file_names = os.listdir(relative_path_to_var_files)
    return ["-var-file={}".format(os.path.abspath(relative_path_to_var_files + file_name))
            for file_name in variable_file_names]


def generate_s3_bucket_init_string(environment, infra_target):
    return ['-backend-config=bucket={}'.format(generate_bucket_name(environment)),
            '-backend-config=region=us-west-2',
            '-backend-config=key={}'.format(generate_state_file_name(environment, infra_target))]


def invoke_terraform_command(parameters):
    subprocess.run(['terraform'] + parameters, check=True)


def initialise_bucket(environment):
    bucket_name = generate_bucket_name(environment)
    s3 = boto3.resource('s3')
    try:
        s3.meta.client.head_bucket(Bucket=bucket_name)
        print("Bucket exists - {}".format(bucket_name))
        return
    except ClientError:
        print("The bucket does not exist or you have no access - {}".format(bucket_name))

    try:
        print("Attempting to create bucket - {}".format(bucket_name))
        s3.create_bucket(Bucket=bucket_name, CreateBucketConfiguration={'LocationConstraint': 'us-west-2'})
        print("Bucket created - {1}".format(1, bucket_name))
        return
    except ClientError as e:
        print("Failed to create bucket")
        print(traceback.format_exception(None, e, e.__traceback__), file=sys.stderr, flush=True)
        exit(1)


def terraform_setup(args, environment):
    initialise_bucket(environment)
    invoke_terraform_command(['get'])
    invoke_terraform_command(['init'] + args)


def generate_terraform_argument_string(command, environment, infrastructure_target):
    terraform_variable_files_string = generate_terraform_vars_file_input_string_for(environment)
    if command == "plan":
        state_file_name = generate_state_file_name(environment, infrastructure_target)
        return ['plan', '-out={}'.format(state_file_name)] + terraform_variable_files_string
    return [command] + terraform_variable_files_string


def terraform(command, environment, infrastructure_target):
    terraform_argument_string = generate_terraform_argument_string(command, environment, infrastructure_target)
    terraform_backend_init_string = generate_s3_bucket_init_string(environment, infrastructure_target)
    navigate_to("infrastructure/{}".format(infrastructure_target))
    terraform_setup(terraform_backend_init_string, environment)
    invoke_terraform_command(terraform_argument_string)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Execute Terraform commands.')
    parser.add_argument('command', help="Plan or apply", choices=['plan', 'apply', 'destroy'])
    parser.add_argument('environment', help="Environment target. (e.g. development, management)", type=str,
                        choices=['development', 'management'])
    parser.add_argument('infrastructure_target', help="Infrastructure target. (e.g. network, management)", type=str,
                        choices=['management', 'network'])

    args = parser.parse_args()
    terraform(args.command, args.environment, args.infrastructure_target)
