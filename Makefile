
deploy-cluster:
	./deploy-aks.azcli

enable-dapr:
	dapr init --kubernetes

all: deploy-cluster enable-dapr