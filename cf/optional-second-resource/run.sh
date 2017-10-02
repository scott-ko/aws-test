#!/bin/bash -ex

aws cloudformation validate-template --template-body file://optional-second-resource.yaml

aws cloudformation create-stack --stack-name optional-second-resource-stack --template-body file://optional-second-resource.yaml --parameters ParameterKey=Cidr1,ParameterValue=10.0.0.0/24
#aws cloudformation wait stack-create-complete --stack-name test-conditional-sg-stack

sleep 10
awless list securitygroups

aws cloudformation delete-stack --stack-name optional-second-resource-stack
sleep 10

aws cloudformation create-stack --stack-name optional-second-resource-stack --template-body file://optional-second-resource.yaml --parameters ParameterKey=Cidr1,ParameterValue=10.0.0.0/24 ParameterKey=Cidr2,ParameterValue=10.0.1.0/24
sleep 10
awless list securitygroups
aws cloudformation delete-stack --stack-name optional-second-resource-stack

