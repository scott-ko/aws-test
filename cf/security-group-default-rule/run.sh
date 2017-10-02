#!/bin/bash -ex

aws cloudformation validate-template --template-body file://no-value-property-value.yaml

aws cloudformation create-stack --stack-name security-group-default-rule --template-body file://no-value-property-value.yaml 
sleep 10
awless list securitygroups

aws cloudformation delete-stack --stack-name security-group-default-rule
sleep 10


aws cloudformation create-stack --stack-name security-group-default-rule --template-body file://no-value-property-value.yaml --parameters ParameterKey=Cidr1,ParameterValue=10.0.10.0/24
sleep 10
awless list securitygroups

aws cloudformation delete-stack --stack-name security-group-default-rule
