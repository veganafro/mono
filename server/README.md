# Summary

Resources related to backend services that support the Mono iOS and Android clients can be found here.

## Structure

```
server
├── cmd
│   └── dummy
│       ├── idl
│       │   └── dummy.proto
│       └── main.go
├── pkg
│   └── dummy_gen
│       └── dummy_gen.pb.go
├── Dockerfile
├── Dockerfile.test
├── go.mod
└── go.sum
```

* cmd

⋅⋅⋅ `cmd` contains service entry points in the `main.go` file and service definitions as represented by `.proto` files. Each directory in `cmd` maps to a similarly named service.

* pkg

⋅⋅⋅ `pkg` contains shared code and libraries. Typically, this will mean the generated gRPC service and protocol buffer messages.

## Getting started

It's assumed that the Go environment (`$GOPATH` and `$GOBIN`) have been correctly setup. In order to get started, clone this repo, install the following tools:
* [`protoc`](https://grpc.io/docs/protoc-installation/) - This is the protocol buffer compiler
* [`protoc-gen-go`](https://grpc.io/docs/languages/go/quickstart/) - This is a compiler plugin to `protoc` that enables the compiler to generate Go code

```
$ brew install protobuf
$ GO111MODULE=on go get github.com/golang/protobuf/protoc-gen-go
```

* [`docker`](https://docs.docker.com/docker-for-mac/install/) - This is a containerization tool that services will run in
⋅⋅⋅ Install `docker` manually by following the steps linked above

* [`googleapis`](https://github.com/googleapis/googleapis) - This repo provides some helpful tools and `.proto` files for transcoding HTTP/JSON to gRPC

```
$ go get github.com/googleapis/googleapis@v0.0.0-20200814034631-3a54e988edcb
```

After these steps, you should be able to bring up existing services using `make start` and `make stop`, as well as define and generate code
for new services using `make proto SERVICE="..." PROTO="..."` where `SERVICE` and `PROTO` are the name of the service's directory i.e. `dummy` and
the name of the service definition file i.e. `dummy.proto`.

