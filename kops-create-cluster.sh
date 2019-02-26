#!/bin/bash

set -a

source ./config.cfg

kops create cluster \
    --name=$NAME \
    --zones=eu-west-1a \
    --node-count=2 \
    --node-size=t2.micro \
    --master-size=t2.micro \
    --dns-zone=kube-tut.tech
