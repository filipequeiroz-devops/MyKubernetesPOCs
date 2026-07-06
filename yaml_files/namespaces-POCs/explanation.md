## Namespaces POC's

In this folder, I'll try allocating kubernetes resources in different namespaces

### kubectl create namespace frontend --save-config
Create a namespace


### kubectl apply -f pod_to_pod_communication_POC/tomcat-pod.yml --namespace=frontend
Creates a pod in an specific namespace, in this case, front end


### kubectl config set-context --current --namespace=frontend
Defines de current namespace

