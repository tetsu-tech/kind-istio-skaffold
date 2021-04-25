# 環境変数
OS   := $(shell go env GOOS)
ARCH := $(shell go env GOARCH)

# bin path
BIN_DIR := $(shell pwd)/bin

# ライブラリのversion系
KUBERNETES_VERSION         := 1.20.2
KIND_VERSION               := 0.10.0
ISTIO_VERSION              := 1.10.0-alpha.0

KIND                    := $(abspath $(BIN_DIR)/kind)
ISTIOCTL                := $(abspath $(BIN_DIR)/istioctl)

KIND_CLUSTER_NAME := kind-test

# commands
KIND_CMD    := $(KIND) --name $(KIND_CLUSTER_NAME)

kind: $(KIND)
$(KIND):
	curl -Lso $(KIND) https://github.com/kubernetes-sigs/kind/releases/download/v$(KIND_VERSION)/kind-$(OS)-$(ARCH)
	chmod +x $(KIND)

istioctl: $(ISTIOCTL)
$(ISTIOCTL):
ifeq ($(OS)-$(ARCH), darwin-amd64)
	curl -sSL "https://storage.googleapis.com/istio-release/releases/$(ISTIO_VERSION)/istioctl-$(ISTIO_VERSION)-osx.tar.gz" | tar -C $(BIN_DIR) -xzv istioctl
else ifeq ($(OS)-$(ARCH), darwin-arm64)
	curl -sSL "https://storage.googleapis.com/istio-release/releases/$(ISTIO_VERSION)/istioctl-$(ISTIO_VERSION)-osx-arm64.tar.gz" | tar -C $(BIN_DIR) -xzv istioctl
else
	curl -sSL "https://storage.googleapis.com/istio-release/releases/$(ISTIO_VERSION)/istioctl-$(ISTIO_VERSION)-$(OS)-$(ARCH).tar.gz" | tar -C $(BIN_DIR) -xzv istioctl
endif

.PHONY: cluster
cluster:
	$(KIND_CMD) delete cluster
	$(KIND_CMD) create cluster --image kindest/node:v${KUBERNETES_VERSION}

.PHONY: clean
clean:
	$(KIND_CMD) delete cluster
	rm -f $(BIN_DIR)/*

.PHONY: up
up:
	skaffold dev

.PHONY: install-deps
install-deps:
	./scripts/setup.sh
