#!/bin/bash

kubectl delete -f ./manifests/01_keycloak.yml
kubectl delete -f ./manifests/02_configmaps.yml
kubectl delete -f ./manifests/03_configserver.yml
kubectl delete -f ./manifests/04_eurekaserver.yml
kubectl delete -f ./manifests/10_accounts-db.yml
kubectl delete -f ./manifests/11_loans-db.yml
kubectl delete -f ./manifests/12_cards-db.yml
kubectl delete -f ./manifests/21_accounts.yml
kubectl delete -f ./manifests/22_loans.yml
kubectl delete -f ./manifests/23_cards.yml
kubectl delete -f ./manifests/30_gateway.yml
