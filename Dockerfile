FROM ubuntu:20.04
RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list \
    && apt-get clean \
    && apt-get update \
    && apt-get install -y vim wget xz-utils python3 python3-dev python3-pip \
        libxslt1-dev zlib1g-dev libglib2.0 libsm6 \
        libgl1-mesa-glx libprotobuf-dev gcc \
        curl \
    && rm -rf /var/lib/apt/lists/*
COPY doc/requirements_cp38-1.4.0.txt /tmp
COPY packages/rknn_toolkit2-1.4.0_22dcfef4-cp38-cp38-linux_x86_64.whl /tmp
RUN python3 -m pip install -i https://mirror.baidu.com/pypi/simple --upgrade pip \
    && pip3 install numpy==1.19.5 -i https://mirror.baidu.com/pypi/simple \
    && pip3 install -r /tmp/requirements_cp38-1.4.0.txt -i https://mirror.baidu.com/pypi/simple \
    && pip3 install /tmp/rknn_toolkit2-1.4.0_22dcfef4-cp38-cp38-linux_x86_64.whl