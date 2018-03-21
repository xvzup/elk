#!/bin/bash

echo "Deleting ..."
kubectl delete -f logger-deploy.yaml 
kubectl delete cm filebeat-config 
kubectl delete cm prospector-assured-config 

echo "Installing ..."
kubectl create configmap filebeat-config --from-file=filebeat.yml=filebeat.yml 
kubectl create configmap prospector-assured-config --from-file=assured.yml=prospector-assured.yml 
kubectl apply -f logger-deploy.yaml
