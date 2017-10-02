#!/bin/bash -ex

aws cloudformation validate-template --template-body file://conditional-sg-creation.yaml

aws cloudformation create-stack --stack-name test-conditional-sg-stack --template-body file://conditional-sg-creation.yaml --parameters ParameterKey=Environment,ParameterValue=PROD 
#aws cloudformation wait stack-create-complete --stack-name test-conditional-sg-stack

sleep 10
awless list securitygroups

aws cloudformation delete-stack --stack-name test-conditional-sg-stack 
sleep 10

aws cloudformation create-stack --stack-name test-conditional-sg-stack --template-body file://conditional-sg-creation.yaml --parameters ParameterKey=Environment,ParameterValue=TEST 
sleep 10
awless list securitygroups
aws cloudformation delete-stack --stack-name test-conditional-sg-stack 

