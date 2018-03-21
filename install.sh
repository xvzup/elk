#!/bin/bash

echo "Deleting ..."
kubectl delete -f elk-deploy.yaml
kubectl delete -f elk-pvc.yaml
kubectl delete cm elasticsearch-config -n logging
kubectl delete cm logstash-config -n logging
kubectl delete -f elk-svc-public.yaml
kubectl delete -f elk-svc.yaml

echo "Installing ..."
kubectl apply -f elk-pvc.yaml
kubectl create configmap elasticsearch-config --from-file=elasticsearch.yml=elasticsearch.yml -n logging
kubectl create configmap logstash-config --from-file=logstash.conf=logstash.conf -n logging
kubectl apply -f elk-deploy.yaml
kubectl apply -f elk-svc.yaml
kubectl apply -f elk-svc-public.yaml
