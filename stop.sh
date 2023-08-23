#!/bin/bash

#stop gateway
./gateway/72crm.sh "stop"

#stop authorization
./authorization/72crm.sh "stop"

#stop admin
./admin/72crm.sh "stop"

#stop bi
./bi/72crm.sh "stop"

#stop crm
./crm/72crm.sh "stop"

#stop examine
./examine/72crm.sh "stop"

#stop job
./job/72crm.sh "stop"

#stop oa
./oa/72crm.sh "stop"

#stop work
./work/72crm.sh "stop"

