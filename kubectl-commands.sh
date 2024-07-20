#!/bin/bash

kubectl apply -f ./manifests/01_keycloak.yml
kubectl apply -f ./manifests/02_configmaps.yml
kubectl apply -f ./manifests/03_configserver.yml
kubectl apply -f ./manifests/04_eurekaserver.yml
kubectl apply -f ./manifests/10_accounts-db.yml
kubectl apply -f ./manifests/11_loans-db.yml
kubectl apply -f ./manifests/12_cards-db.yml
kubectl apply -f ./manifests/21_accounts.yml
kubectl apply -f ./manifests/22_loans.yml
kubectl apply -f ./manifests/23_cards.yml
kubectl apply -f ./manifests/30_gateway.yml
