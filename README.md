# Docker image for rdkafka & Python3 based on Alpine.

[![Docker pipeline workflow](https://github.com/exaspace/docker-python3-rdkafka/actions/workflows/main.yml/badge.svg)](https://github.com/exaspace/docker-python3-rdkafka/actions/workflows/main.yml)

Use this base image if you want to run Python3 apps that need rdkafka.

	docker pull exaspace/python3-rdkafka

* Small image size (roughly 150MB).
* Rebuilt every week to ensure security updates and latest versions are applied


## Contains 

* Python3
* librdkafka
* confluent-kafka (installed via pip)
  