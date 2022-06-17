PATH := $(PATH)
SHELL := /usr/bin/zsh

opentelemetry-build:
	rm -rf $$(pwd)/opentelemetry-collector
	git clone https://github.com/open-telemetry/opentelemetry-collector-contrib.git $$(pwd)/opentelemetry-collector
	cd $$(pwd)/opentelemetry-collector ; make install-tools
	cd $$(pwd)/opentelemetry-collector ; make otelcontribcol

otel-metrics:
	$$(pwd)/opentelemetry-collector/bin/otelcontribcol_linux_amd64 --config $$(pwd)/otel-config-metrics.yaml

otel-traces:
	sudo $$(pwd)/opentelemetry-collector/bin/otelcontribcol_linux_amd64 --config $$(pwd)/otel-collector-config.yaml

prometheus:
	docker run -d -v $$(pwd)/prometheus.yml:/etc/prometheus/prometheus.yml -p 8080:8080 --name prometheus prom/prometheus --config.file=/etc/prometheus/prometheus.yml --web.listen-address=:8080

otel-collector:
	docker compose -f ./docker-compose.yaml --project-name otel up -d