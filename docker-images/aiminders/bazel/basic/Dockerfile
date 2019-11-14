# 2018/04/05:
#   upgrade to bazel 0.11.0.
#   upgrade to golang 1.10.
#   upgrade to latest python grpc.
FROM ubuntu:16.04

ARG BAZEL_VERSION=0.11.0

ARG GO_VERSION=1.10

RUN (export HTTP_PROXY=$HTTP_PROXY; export HTTPS_PROXY=$HTTP_PROXY; \
    apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        git \
        openjdk-8-jdk \
        openjdk-8-jre-headless \
        openssh-client \
        python=2.7.* \
        python-pip \
        unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    pip --no-cache-dir install --upgrade pip && \
    pip --no-cache-dir install grpcio && \
    curl -L https://github.com/bazelbuild/bazel/releases/download/${BAZEL_VERSION}/bazel-${BAZEL_VERSION}-without-jdk-installer-linux-x86_64.sh \
        --output /tmp/bazel-installer.sh && \
    chmod +x /tmp/bazel-installer.sh && \
    bash /tmp/bazel-installer.sh && \
    rm /tmp/bazel-installer.sh && \
    curl -L https://golang.org/dl/go${GO_VERSION}.linux-amd64.tar.gz | tar zx -C /usr/lib && \
    touch /root/WORKSPACE)

WORKDIR /root

CMD ["/bin/bash"]
