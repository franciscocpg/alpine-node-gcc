TAG := franciscocpg/alpine-node-gcc

build:
	clear \
	docker pull mhart/alpine-node:6; \
	docker build -t ${TAG} .

clean:
	docker rmi ${TAG}

rebuild: clean build

release:
	clear
	bash -c 'export GCC_VERSION=$$(docker run $(TAG) gcc --version); \
	export NODE_VERSION=$$(docker run $(TAG) node -v); \
	export PYTHON_VERSION=$$(docker run -it $(TAG) python --version); \
	bash README.tpl > README.md'

run:    
	docker run --rm -it ${TAG} sh

.PHONY: build
