### install helm
brew install helm

### add kubernetes dashboard repo
helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/

### deploy a Helm Release named "kubernetes-dashboard" using the kubernetes-dashboard chart
helm upgrade --install kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard --create-namespace --namespace kubernetes-dashboard

### run kubernetes-dashboard
kubectl -n kubernetes-dashboard port-forward svc/kubernetes-dashboard-kong-proxy 8443:443

### create service account user
(1) create file dashboard-adminuser.yaml with content:
---
apiVersion: v1
kind: ServiceAccount
metadata:
  name: admin-user
  namespace: kubernetes-dashboard
---
(2) execute command:
kubectl apply -f dashboard-adminuser.yaml

### create rolebinding 
(1) create file dashboard-rolebinding.yaml with comtent:
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: admin-user
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: admin-user
  namespace: kubernetes-dashboard
---

(2) excute command:
kubectl apply -f dashboard-rolebinding.yaml


### create token for service acount
kubectl -n kubernetes-dashboard create token admin-user

### create long-lived bearer token (secret)
(1) create file secret.yaml wuth content:
---
apiVersion: v1
kind: Secret
metadata:
  name: admin-user
  namespace: kubernetes-dashboard
  annotations:
    kubernetes.io/service-account.name: "admin-user"   
type: kubernetes.io/service-account-token
---

(2) execute command
kubectl apply -f secret.yaml

### save token in secret
kubectl get secret admin-user -n kubernetes-dashboard -o jsonpath={".data.token"} | base64 -d

### get deployments
kubectl get deployments

### get services
kubectl get deployments

### get replica sets
kubectl get replicasets

### apply configserver manifest
kubectl apply -f ./manifests/03_configserver.yml
