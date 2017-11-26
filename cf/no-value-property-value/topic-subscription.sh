#!/bin/bash -ex

aws cloudformation validate-template --template-body file://topic-subscription.yaml

aws cloudformation create-stack --stack-name topic-subscription-test-stack --template-body file://topic-subscription.yaml 

sleep 60
aws cloudformation delete-stack --stack-name topic-subscription-test-stack
