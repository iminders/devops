# 2017/06/28: upgrade to bazel 0.9.0 , golang 1.9.1
# 2017/07/11: install python grpc so we can build and test python grpc services.
FROM ubuntu:16.04

RUN (apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        git \
        openssh-client \
        python=2.7.* \
        python3=3.5.* \
        python-pip \
        python3-pip \
        openjdk-8-jdk \
        openjdk-8-jre-headless && \
    echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | \
        tee /etc/apt/sources.list.d/bazel.list && \
    curl https://bazel.build/bazel-release.pub.gpg | apt-key add - && \
    apt-get update && \
    apt-get install -y --no-install-recommends bazel && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    curl -L https://golang.org/dl/go1.9.1.linux-amd64.tar.gz | tar zx -C /usr/lib && \
    pip install grpcio && \
    pip3 install grpcio && \
    touch /root/WORKSPACE)

WORKDIR /root

CMD ["bin/bash"]
