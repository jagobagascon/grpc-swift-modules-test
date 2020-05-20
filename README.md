This project is intenteded to replicate [this bug report](https://github.com/grpc/grpc-swift/issues/801).

The Makefile contains three rules:
```shell
generate_single: # generates code in a single call to protoc then moves it to its module
generate: # generates code calling protoc once per module
build: # builds generated code
```