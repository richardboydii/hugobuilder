FROM python:3.7.2-alpine3.8
MAINTAINER Richard Boyd II <mail@richardboydii.com>

ENV HUGO_VER 0.53

# Install bash and git
RUN apk update && apk add bash git && rm -rf /var/cache/apk/*

# Install the AWS CLI
RUN pip install awscli 

# Create a local dir for Hugo, download and install
RUN mkdir /usr/local/hugo
ADD https://github.com/spf13/hugo/releases/download/v${HUGO_VER}/hugo_${HUGO_VER}_linux-64bit.tar.gz /usr/local/hugo/
RUN tar xzf /usr/local/hugo/hugo_${HUGO_VER}_linux-64bit.tar.gz -C /usr/local/hugo/ \
	&& ln -s /usr/local/hugo/hugo /usr/local/bin/hugo \
	&& rm /usr/local/hugo/hugo_${HUGO_VER}_linux-64bit.tar.gz

# Create a volume to hold the host project
RUN mkdir -p /project
VOLUME /project
