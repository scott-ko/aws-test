#!/bin/bash 

set -ex

STACK=alarm-period-test

aws cloudformation validate-template --template-body file://alarm.yaml

aws cloudformation deploy --stack-name $STACK --template-file alarm.yaml  --parameter-overrides SNSAlertEmail=${email:?}

