
generate_single:
	mkdir -p ./generated/Sources/ModuleA
	mkdir -p ./generated/Sources/ModuleB
	protoc -I ./ -I ./third_party --swift_opt=Visibility=Public \
			--swift_opt=FileNaming=DropPath \
			--swift_opt=ProtoPathModuleMappings="swift_module_mapping" \
			--swift_out="./generated/Sources" \
			--grpc-swift_opt=Visibility=Public \
			--grpc-swift_opt=FileNaming=DropPath \
			--grpc-swift_opt=Client=true \
			--grpc-swift_opt=Server=false \
			--grpc-swift_opt=ProtoPathModuleMappings="swift_module_mapping" \
			--grpc-swift_out="./generated/Sources" a.proto b.proto
	mv ./generated/Sources/a.*.swift ./generated/Sources/ModuleA
	mv ./generated/Sources/b.*.swift ./generated/Sources/ModuleB

generate:
	mkdir -p ./generated/Sources/ModuleA
	mkdir -p ./generated/Sources/ModuleB
	protoc -I ./ -I ./third_party --swift_opt=Visibility=Public \
			--swift_opt=FileNaming=DropPath \
			--swift_opt=ProtoPathModuleMappings="swift_module_mapping" \
			--swift_out="./generated/Sources/ModuleA" \
			--grpc-swift_opt=Visibility=Public \
			--grpc-swift_opt=FileNaming=DropPath \
			--grpc-swift_opt=Client=true \
			--grpc-swift_opt=Server=false \
			--grpc-swift_opt=ProtoPathModuleMappings="swift_module_mapping" \
			--grpc-swift_out="./generated/Sources/ModuleA" a.proto
	protoc -I ./ -I ./third_party --swift_opt=Visibility=Public \
			--swift_opt=FileNaming=DropPath \
			--swift_opt=ProtoPathModuleMappings="swift_module_mapping" \
			--swift_out="./generated/Sources/ModuleB" \
			--grpc-swift_opt=Visibility=Public \
			--grpc-swift_opt=FileNaming=DropPath \
			--grpc-swift_opt=Client=true \
			--grpc-swift_opt=Server=false \
			--grpc-swift_opt=ProtoPathModuleMappings="swift_module_mapping" \
			--grpc-swift_out="./generated/Sources/ModuleB" b.proto

build:
	cd ./generated; swift build;