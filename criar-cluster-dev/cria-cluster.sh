#!/bin/sh
cluster_name='kind-dev'
#kind create cluster --name $cluster_name --config cluster-dev.yaml
kind create cluster --config cluster-dev.yaml

