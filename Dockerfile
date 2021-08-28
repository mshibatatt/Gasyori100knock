FROM ubuntu:20.04
LABEL auther="Masahiro Shibata mshibatatt.com"

ENV DEBIAN_FRONTEND=noninteractive 
ENV TZ=Asia/Tokyo 

RUN apt-get update \
    && apt-get install -y \
        git python3 python3-dev python3-pip \
        libopencv-dev \
    # to run kernel in ipynb
    && pip install -U ipykernel \
    # to clean up
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* 

COPY requirements.txt /tmp/pip-tmp/
RUN pip install -r /tmp/pip-tmp/requirements.txt \
    && rm -rf /tmp/pip-tmp

CMD ["/bin/bash"]