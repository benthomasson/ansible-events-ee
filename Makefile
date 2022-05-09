
.PHONY: all build


all: build

build:
	ansible-builder build --tag quay.io/bthomass/ansible-events:latest --container-runtime docker

docker-build:
	docker build -f context/Dockerfile -t quay.io/bthomass/ansible-events:latest context

run:
	docker run -it quay.io/bthomass/ansible-events:latest ansible-events --rules benthomasson.eda.hello_events -i inventory.yml

shell:
	docker run -it  quay.io/bthomass/ansible-events:latest /bin/bash

push:
	docker push quay.io/bthomass/ansible-events:latest
