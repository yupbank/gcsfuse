FROM golang:1.10.0-alpine
ARG VERSION=3.2.0
LABEL version=$VERSION

WORKDIR /src

# Install GCS Fuse
RUN apk add --no-cache git
ENV GOPATH /go
RUN go get -u github.com/googlecloudplatform/gcsfuse
FROM alpine:3.6
RUN apk add --no-cache ca-certificates fuse && rm -rf /tmp/*
COPY --from=0 /go/bin/gcsfuse /usr/local/bin
CMD ["sleep", "500"]
