GOCMD=go 
GOBUILD=$(GOCMD) build
GOINSTALL=$(GOCMD) install
GOCLEAN=$(GOCMD) clean
GOTEST=$(GOCMD) test
GOGET=$(GOCMD) get 
BINARY_NAME=echidna
LINTER=golangci-lint 

all: test build 

test: 
	$(GOTEST) ./... -v

build:
	$(GOBUILD) -o $(BINARY_NAME) -v

lint:
	$(LINTER) run

install:
	$(GOINSTALL)

local: lint test install

clean:
	cmd /c if exist current rmdir  current /Q /S 
	cmd /c if exist inspect rmdir inspect  /Q /S
	cmd /c if exist error.log del /f error.log