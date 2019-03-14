FROM alpine:latest

LABEL maintainer="Balazs Nadasdi <balazs.nadasdi@cheppers.com>"

LABEL org.label-schema.vcs-url="https://github.com/yitsushi/drone-k8s-set-image" \
      org.label-schema.docker.dockerfile="/Dockerfile"

ENV KUBE_LATEST_VERSION="v1.13.4"
RUN apk add --update ca-certificates \
    && apk add --update -t deps curl \
    && curl -L \
        -o /usr/local/bin/kubectl \
        https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    && apk del --purge deps \
    && rm /var/cache/apk/*

COPY entry.sh /entry.sh
RUN chmod +x /entry.sh

WORKDIR /root
ENTRYPOINT ["/entry.sh"]
