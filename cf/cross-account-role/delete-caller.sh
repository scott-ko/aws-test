#!/bin/bash

set -ex

aws cloudformation delete-stack --stack-name role-test-stack 
