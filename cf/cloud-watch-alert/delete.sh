#!/bin/bash

STACK=alarm-period-test
aws cloudformation delete-stack --stack-name $STACK
