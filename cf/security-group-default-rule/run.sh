#!/bin/bash -ex

aws cloudformation validate-template --template-body file://no-value-property-value.yaml

aws cloudformation deploy --stack-name security-group-default-rule --template-file no-value-property-value.yaml 

awless list securitygroups

aws cloudformation delete-stack --stack-name security-group-default-rule
sleep 10


aws cloudformation deploy --stack-name security-group-default-rule --template-file no-value-property-value.yaml --parameter-overrides ParameterKey=Cidr1 ParameterValue=10.0.10.0/24
awless list securitygroups

aws cloudformation delete-stack --stack-name security-group-default-rule
