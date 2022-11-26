# Docker image for rdkafka & Python3 based on Alpine.


Use this base image if you want to run Python3 apps that need rdkafka.

	docker pull exaspace/python3-rdkafka

* Small image size (roughly 150MB).
* The image is rebuilt every week to ensure security updates and latest versions are applied


## Contains 

* Python3
* librdkafka
* confluent-kafka (installed via pip)
  