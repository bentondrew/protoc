FROM golang:1.12.5 as builder
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    unzip && \
    rm -rf /var/lib/apt/lists/* && \
    addgroup -gid 1000 gouser && \
    adduser --disabled-password --gecos '' -u 1000 -gid 1000 gouser && \
    go get -u google.golang.org/grpc && \
    wget https://github.com/protocolbuffers/protobuf/releases/download/v3.7.1/protoc-3.7.1-linux-x86_64.zip && \
    unzip protoc-3.7.1-linux-x86_64.zip && \
    mv bin/protoc /usr/local/bin && \
    mv include/google/ /usr/local/include/ && \
    rm -rf include/ protoc-3.7.1-linux-x86_64.zip readme.txt && \
    go get -u github.com/golang/protobuf/protoc-gen-go
USER gouser
ENTRYPOINT ["protoc"]
CMD ["--help"]
