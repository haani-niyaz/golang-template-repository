SHELL=/bin/bash -e -o pipefail
PWD = $(shell pwd)

# Vars
DOCKER_REPO := rog-golang-buddies/template
DOCKER_TAG := latest

help:
	@echo 'Usage: make <OPTIONS> ... <TARGETS> <ARGUMENTS>'
	@echo ''
	@echo 'Available targets are:'
	@echo ''
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':'  | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
	@echo ''


.PHONY: download
## download: Downloads the dependencies
download:
	@go mod download

.PHONY: tidy
## tidy: Cleans up go.mod and go.sum
tidy:
	@go mod tidy

.PHONY: fmt
## fmt: Formats all code with go fmt
fmt:
	@go fmt ./...

.PHONY: run
## run: Runs the app
run: fmt
	@go run --race cmd/main.go

.PHONY: test-build
## test-build: Tests if code compiles
test-build:
	@go build -o /dev/null ./...

.PHONY: build
## build: Builds binary
build:
	@mkdir -pv bin && go build -ldflags="-w -s" -o bin/app ./...

.PHONY: test
## test: Runs all tests
test:
	@go test ./... -v -coverpkg=./... -coverprofile cover.out
	@go tool cover -func cover.out
	@rm cover.out

.PHONY: vet
## vet: Examines Go source code and reports suspicious constructs
vet:
	@go vet -v ./...

.PHONY: docker
## docker-build: Builds docker image
docker-build:
	docker build ${ARGS}  -t  $(DOCKER_REPO):$(DOCKER_TAG) .
