
deploy-cluster:
	./deploy-aks.azcli

enable-dapr:
	dapr init --kubernetes

deploy-redis:
	kubectl create namespace dapr-redis
	helm repo add bitnami https://charts.bitnami.com/bitnami
	helm repo update
	helm install redis bitnami/redis -n dapr-redis
	kubectl apply -f charts/redis-state.yaml
	kubectl apply -f charts/redis-pubsub.yaml

all: deploy-cluster enable-dapr deploy-redis