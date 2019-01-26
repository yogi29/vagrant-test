#!/bin/bash
yum update -y --exclude=kernel

#install tools
yum install -y vim wget git unzip net-tools screen nc telnet
