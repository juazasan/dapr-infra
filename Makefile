
deploy-cluster:
	./deploy-aks.azcli

enable-dapr:
	dapr init --kubernetes

deploy-redis:
	helm repo add bitnami https://charts.bitnami.com/bitnami
	helm repo update
	helm install redis bitnami/redis --set cluster.enabled=false -n default
	kubectl create rolebinding default-sa-secrets-read --clusterrole=secret-reader --serviceaccount=default:default --namespace=default
	kubectl apply -f charts/redis-state.yaml
	kubectl apply -f charts/redis-pubsub.yaml

all: deploy-cluster enable-dapr deploy-redis