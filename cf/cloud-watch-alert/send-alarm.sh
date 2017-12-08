#!/bin/bash
set -ex
aws cloudwatch put-metric-data --metric-name PeriodTest --namespace "Dev/Test1" --timestamp "$(date -u +''%FT%T.000Z'')" --value 1

