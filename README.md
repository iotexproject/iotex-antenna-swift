# IoTeX swift

## Develop

### Build proto

```
mkdir protogen
protoc \
proto/api/api.proto proto/rpc/rpc.proto \
proto/types/action.proto proto/types/blockchain.proto proto/types/consensus.proto \
proto/types/endorsement.proto proto/types/genesis.proto proto/types/node.proto \
--swift_opt=Visibility=Public \
--swift_out=protogen \
--swiftgrpc_out=Visibility=Public,Client=true,Server=false:./protogen
find protogen -name "*.swift" -exec mv {} Sources/Protogen \;
rm -rf protogen
```

