# protoc

## Overview
Repo with instructions on how to build a Docker image which installs protoc

## Docker image build command

### Local build
```Bash
docker build -t protoc:0.1.0 .
```

## Image run command
```Bash
docker run --rm protoc:0.1.0
```
This should run protoc with the help argument. To run add desired arguments.

## Versions

| Version | Comment|
| ---:|:---|
| 0.1.0 | Install protoc. |
