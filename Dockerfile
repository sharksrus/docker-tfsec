FROM alpine:3.13.4
LABEL Glen Stummer <glen@glen.dev>

ENV TFSEC_VERSION=0.39.20
SHELL ["/bin/ash", "-eo", "pipefail", "-c"]
RUN apk add --no-cache --virtual .build-deps \
    zip \
    wget \
    curl &&\
    wget https://github.com/tfsec/tfsec/releases/download/v${TFSEC_VERSION}/tfsec-linux-amd64 &&\
    chmod +x  tfsec-linux-amd64 &&\
    mv tfsec-linux-amd64 /usr/local/bin/tfsec &&\
    apk del --purge .build-deps

ENTRYPOINT ["/usr/local/bin/tfsec"]
CMD ["tfsec"]
