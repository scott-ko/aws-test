#!/bin/bash

set -ex

aws cloudformation validate-template --template-body file://caller-account.yaml

aws cloudformation deploy --stack-name role-test-stack  --template-file caller-account.yaml  --parameter-overrides RemoteRoleARN=${RemoteRoleARN:?} SshCidr=0.0.0.0/0 --capabilities CAPABILITY_NAMED_IAM
