# 2018/04/06:
#  upgrade to bazel 0.11.0
#  upgrade to latest tensorflow version (1.7)

FROM aiminders/library:bazel.latest

RUN (export HTTP_PROXY=$HTTP_PROXY; export HTTPS_PROXY=$HTTP_PROXY; \
    apt-get update && apt-get install -y --no-install-recommends \
        libfreetype6-dev \
        libpng12-dev \
        libzmq3-dev \
        pkg-config \
        python-dev \
        rsync \
        software-properties-common && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*)

RUN (export HTTP_PROXY=$HTTP_PROXY; export HTTPS_PROXY=$HTTP_PROXY; \
    pip --no-cache-dir install \
        h5py \
        numpy \
        scipy \
        pandas \
        sklearn \
        matplotlib \
        Pillow \
        tensorflow \
        glog \
        pyemd \
        gensim==3.2.0 \
        nltk \
        boto3 \
        hanziconv \
        texttable \
        jieba \
        PyYAML \
        tushare \
        prometheus_client\
        Flask)

WORKDIR /root

CMD ["/bin/bash"]
