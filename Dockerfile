FROM amazonlinux

RUN mkdir /terraform

RUN yum -y update && \
yum -y install unzip && \
curl -o terraform.zip "https://releases.hashicorp.com/terraform/0.11.3/terraform_0.11.3_linux_amd64.zip" && \
unzip terraform.zip -d /terraform && \
rm terraform.zip
ENV PATH="/terraform:${PATH}"

WORKDIR /deploy
ADD . /deploy

RUN terraform init
