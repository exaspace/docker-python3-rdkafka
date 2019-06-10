REGISTRY=  exaspace
IMAGE    = python3-rdkafka
VERSION  = $(shell git describe --tags)

DOCKER=$(shell docker info >/dev/null 2>&1 && echo "docker" || echo "sudo docker")

all: latest

build:
	$(DOCKER) build $(build_opts) -t $(REGISTRY)/$(IMAGE):$(VERSION) ./

latest: build
	$(DOCKER) tag $(REGISTRY)/$(IMAGE):$(VERSION) $(REGISTRY)/$(IMAGE):latest

push:
	$(DOCKER) push $(REGISTRY)/$(IMAGE):$(VERSION)
	$(DOCKER) push $(REGISTRY)/$(IMAGE):latest
