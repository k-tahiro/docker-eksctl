FROM python:alpine

# install aws client
RUN pip install awscli boto3

# install kubectl
ADD https://storage.googleapis.com/kubernetes-release/release/v1.11.5/bin/linux/amd64/kubectl /usr/local/bin/kubectl
RUN chmod +x /usr/local/bin/kubectl

# install eksctl
# https://github.com/weaveworks/eksctl#usage
ARG EKSCTL_VERSION=latest_release
RUN apk add --no-cache curl groff \
    && curl --silent --location "https://github.com/weaveworks/eksctl/releases/download/${EKSCTL_VERSION}/eksctl_Linux_amd64.tar.gz" | tar xz -C /tmp \
    && mv /tmp/eksctl /usr/local/bin

CMD [ "eksctl" ]
