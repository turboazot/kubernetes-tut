#!/bin/bash

set -a

source ./config.cfg

kops update cluster $NAME --yes

watch kops validate cluster $NAME
