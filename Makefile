VERSION	?= $(shell cat VERSION || echo latest)
NAME		?= coinhub
IMAGE		?= rubykube/$(NAME):$(VERSION)
PORT		?= 3080

.PHONY: default build run push

default: build run

build:
	@echo '> Building "$(NAME)" docker image...'
	@docker build -t $(IMAGE) .

run:
	@echo '> Starting "$(NAME)" container...'
	@docker run -p 3080:3080 -d $(IMAGE)

push:
	docker push $(IMAGE)
