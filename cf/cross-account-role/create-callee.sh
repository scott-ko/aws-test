#!/bin/bash

set -ex

aws cloudformation validate-template --template-body file://callee-account.yaml

aws cloudformation deploy --stack-name role-test-stack  --template-file callee-account.yaml  --parameter-overrides RemoteCallerRoleARN=${RemoteCallerRoleARN:?}  --capabilities CAPABILITY_NAMED_IAM
