#!/bin/bash -ex

aws cloudformation validate-template --template-body file://DBInstanceIdentifier.yaml

aws cloudformation create-stack --stack-name DBInstanceIdentifier --template-body file://DBInstanceIdentifier.yaml --parameters ParameterKey=DBInstanceIdentifier,ParameterValue=mydbidentifier1 ParameterKey=MasterUserName,ParameterValue=dbuser1 ParameterKey=MasterUserPassword,ParameterValue=${DB_PASSWORD:?}
aws cloudformation wait stack-create-complete --stack-name DBInstanceIdentifier

awless list databases

# Test MasterUserName change won't cause replacement.

aws cloudformation update-stack --stack-name DBInstanceIdentifier --template-body file://DBInstanceIdentifier.yaml --parameters ParameterKey=DBInstanceIdentifier,ParameterValue=mydbidentifier1 ParameterKey=MasterUserName,ParameterValue=dbuser2 ParameterKey=MasterUserPassword,ParameterValue=${DB_PASSWORD:?}

aws cloudformation wait stack-update-complete --stack-name DBInstanceIdentifier

# Test DBInstanceIdentifier change replaces instance but leaves existing database as is.

aws cloudformation update-stack --stack-name DBInstanceIdentifier --template-body file://DBInstanceIdentifier.yaml --parameters ParameterKey=DBInstanceIdentifier,ParameterValue=mydbidentifier2 ParameterKey=MasterUserName,ParameterValue=dbuser2 ParameterKey=MasterUserPassword,ParameterValue=${DB_PASSWORD:?}

aws cloudformation wait stack-update-complete --stack-name DBInstanceIdentifier

awless list databases

# Add test : take database snapshot. check the backups are retained with replacement

# Add test : When restore database from snapshot, is further PIT recovery supported? Run describe-db-instances to see the possible PIT recovery time.

aws cloudformation delete-stack --stack-name DBInstanceIdentifier

aws cloudformation wait stack-delete-complete --stack-name DBInstanceIdentifier

awless list databases

