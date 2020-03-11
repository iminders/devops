.PHONY: download build build_gpu

download:
	wget https://github.com/bazelbuild/bazel/releases/download/2.1.0/bazel-2.1.0-installer-linux-x86_64.sh
	wget https://www.python.org/ftp/python/3.7.6/Python-3.7.6.tgz

build: download
	docker build -f latest.Dockerfile -t aiminders/library:bazel.latest .

build_gpu: download
	docker build -f latest-gpu.Dockerfile -t mickeyzhoudocker/library:bazel.latest-gpu .