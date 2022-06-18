
# Setup kind
setup-kind:
	kind create cluster --config ./kind.yaml --name dapr
	kubectl cluster-info --context kind-dapr
	# Setup registry
	docker run -d --restart=always -p 5000:5000 --name kind-registry registry:2
	# Connect the registry to the KinD network.
	docker network connect "kind" kind-registry

describe-kind-env:
	@echo "\
	export MINIKUBE_NODE_IP=`kubectl get nodes \
	    -lkubernetes.io/hostname!=kind-control-plane \
        -ojsonpath='{.items[0].status.addresses[?(@.type=="InternalIP")].address}'`\n\
	export DAPR_REGISTRY=$${DAPR_REGISTRY:-localhost:5000/dapr}\n\
	export DAPR_TEST_REGISTRY=$${DAPR_TEST_REGISTRY:-localhost:5000/dapr}\n\
	export DAPR_TAG=dev\n\
	export DAPR_NAMESPACE=dapr-tests"
	

delete-kind:
	docker stop kind-registry && docker rm kind-registry || echo "Could not delete registry."
	kind delete cluster --name kind