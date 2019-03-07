FROM python:alpine

RUN pip install awscli

RUN apk add --no-cache curl

# https://github.com/weaveworks/eksctl#usage
RUN curl --silent --location "https://github.com/weaveworks/eksctl/releases/download/latest_release/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp \
    && mv /tmp/eksctl /usr/local/bin

ENTRYPOINT [ "eksctl" ]
