#!/bin/bash

set -a

source ./config.cfg

kops delete cluster $NAME --yes
