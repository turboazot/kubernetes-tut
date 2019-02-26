#!/bin/bash

source ./config.cfg

kops delete cluster $NAME --yes
