
.PHONY: all build

IMAGE_TAG = quay.io/bthomass/ansible-events:latest
all: build

build:
	ansible-builder build --tag $(IMAGE_TAG) --container-runtime docker

docker-build:
	docker build -f context/Dockerfile -t $(IMAGE_TAG) context

run:
	docker run -it $(IMAGE_TAG) --rules benthomasson.eda.hello_events -i inventory.yml

run_drools:
	docker run --env JAVA_HOME=/usr/lib/jvm/java-17-openjdk --env RULES_ENGINE=drools -it $(IMAGE_TAG) ansible-events --rules benthomasson.eda.hello_events -i inventory.yml
shell:
	docker run -it  $(IMAGE_TAG) /bin/bash

push:
	docker push $(IMAGE_TAG)
