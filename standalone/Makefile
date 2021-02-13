PATH := $(PATH)
SHELL := /usr/bin/zsh

opentelemetry-build:
	rm -rf $$(pwd)/opentelemetry-collector
	git clone https://github.com/open-telemetry/opentelemetry-collector.git $$(pwd)/opentelemetry-collector
	cd $$(pwd)/opentelemetry-collector ; make install-tools
	cd $$(pwd)/opentelemetry-collector ; make otelcol

opentelemetry:
	$$(pwd)/opentelemetry-collector/bin/otelcol_linux_amd64 --config $$(pwd)/otel-config-metrics.yaml

prometheus:
	docker run --rm -v $$(pwd)/prometheus.yml:/etc/prometheus/prometheus.yml -p 8080:8080 --name prometheus prom/prometheus --config.file=/etc/prometheus/prometheus.yml --web.listen-address=:8080