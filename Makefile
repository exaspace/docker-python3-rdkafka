REGISTRY = exaspace
IMAGE    = python3-rdkafka
VERSION  = $(shell git describe --tags)

all: build

build:
	docker buildx build --platform=linux/amd64 --build-arg IMAGE_VERSION=$(VERSION) \
		-t $(REGISTRY)/$(IMAGE):$(VERSION) ./

latest: build
	docker tag $(REGISTRY)/$(IMAGE):$(VERSION) $(REGISTRY)/$(IMAGE):latest

login: 
	# WARNING ensure silent output to avoid printing secrets to stdout
	@test -n "$(DOCKER_HUB_TOKEN)"
	@echo $(DOCKER_HUB_TOKEN) | docker login --username exaspace --password-stdin

push: latest login
	docker push $(REGISTRY)/$(IMAGE):$(VERSION)
	docker push $(REGISTRY)/$(IMAGE):latest

list:
	curl -L -s 'https://registry.hub.docker.com/v2/repositories/$(REGISTRY)/$(IMAGE)/tags?page_size=128'|\
		jq '."results"[]["name"]'

version:
	@echo $(VERSION)


