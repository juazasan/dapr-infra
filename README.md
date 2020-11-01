# Description

Scripts to deploy Kubernetes infrastructure in Azure to support dapr development and testing.

# Instructions

## Deploy all resources

```bash
make all
```

## Deploy only the AKS cluster

```bash
make deploy-cluster
```

## Initialize dapr

```bash
make enable-dapr
```

## Deploy Redis inside the AKS cluster

```bash
make deploy-redis
```