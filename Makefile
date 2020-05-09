SSSS_VERSION:=$(shell cd ssss && git describe --tags | sed 's@.*/@@')

initrepo:
	git submodule update --init --recursive

image: initrepo
	docker build -t centos-ssss:$(SSSS_VERSION) .

run:
	docker run -it --rm centos-ssss:$(SSSS_VERSION)
