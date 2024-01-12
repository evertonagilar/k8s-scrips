# Cluster Kubernetes Kind

[![Kind Status](https://img.shields.io/badge/Kind-Kubernetes%20-326ce5?style=for-the-badge)](https://kind.sigs.k8s.io/)



1. Criar um cluster de desenvolvimento

```shell
$ ./cria-cluster.sh
```

2. Configurar o cluster recem criado para ser usado com o kubectl 

```shell
$ kubectl cluster-info --context kind-kind-dev
Kubernetes control plane is running at https://127.0.0.1:37943
CoreDNS is running at https://127.0.0.1:37943/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
```


3. Criar um registry local para armazenar as imagens que serão usadas no cluster

```shell
$ ./cria-registry.sh 
6aab4ffc0bc38c4fa714809aa05341778fd89782530f9fd0b756151b96f5e96c
No kind nodes found for cluster "kind".
configmap/local-registry-hosting created
```

4. Instalar o nginx como ingress controller

```shell
$ kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
namespace/ingress-nginx created
serviceaccount/ingress-nginx created
serviceaccount/ingress-nginx-admission created
role.rbac.authorization.k8s.io/ingress-nginx created
role.rbac.authorization.k8s.io/ingress-nginx-admission created
clusterrole.rbac.authorization.k8s.io/ingress-nginx created
clusterrole.rbac.authorization.k8s.io/ingress-nginx-admission created
rolebinding.rbac.authorization.k8s.io/ingress-nginx created
rolebinding.rbac.authorization.k8s.io/ingress-nginx-admission created
clusterrolebinding.rbac.authorization.k8s.io/ingress-nginx created
clusterrolebinding.rbac.authorization.k8s.io/ingress-nginx-admission created
configmap/ingress-nginx-controller created
service/ingress-nginx-controller created
service/ingress-nginx-controller-admission created
deployment.apps/ingress-nginx-controller created
job.batch/ingress-nginx-admission-create created
job.batch/ingress-nginx-admission-patch created
ingressclass.networking.k8s.io/nginx created
networkpolicy.networking.k8s.io/ingress-nginx-admission created
validatingwebhookconfiguration.admissionregistration.k8s.io/ingress-nginx-admission created
```

4.1 Para testar o ingress, instale o ingress-sample/http-echo-sample.yaml e execute um teste

```shell
kubectl apply -f ingress-sample/http-echo-sample.yaml 
curl localhost:8080/foo/hostname
```


5. Subir um container debian para diagnóstico com as ferramentas mais usadas

```shell
kubectl run -it debian --image debian
apt update && apt install iputils-ping iproute2 iputils-ping dnsutils wget curl
```


6. Atualizar o ~/.kube/config. Execute o comando abaixo se ocorrer erro ao usar o kubectl

```shell
kind get kubeconfig
```

7. Reiniciar um deployment no cluster (para forçar um reinício das pods)

```shell
kubectl rollout restart deployment portal-webservice-deploy
```


