.DEFAULT_GOAL = all

BUILD_TAG ?= 0.0.0
BUILD_NUMBER ?= 0
GIT_COMMIT ?= 0
LD_FLAGS = -X version.Version=${BUILD_TAG} -X version.BuildID=${BUILD_NUMBER} -X version.Revision=${GIT_COMMIT}
GO_BUILD_FLAGS ?=

#-------------------------------------------------------------------------------
.PHONY: build
build:
	CGO_ENABLED=0 GOOS=linux go build $(GO_BUILD_FLAGS) -ldflags "${LD_FLAGS}"

#-------------------------------------------------------------------------------
.PHONY: docker-build
docker-build:
	docker build --rm -t=albertocsm/sangrenel .

#-------------------------------------------------------------------------------
.PHONY: docker-push
docker-push:
	docker push albertocsm/sangrenel:latest

#-------------------------------------------------------------------------------
.PHONY: all
all: build docker-build docker-push