# iotex-antenna-swift

iotex-antenna-swift is our SDK allowing you to interact with a local or remote iotex blockchain node, using gRPC  connection.
IoTeX is building the next generation of the decentralized network for IoT powered by scalability- and privacy-centric blockchains.
Please refer to IoTeX [whitepaper](https://iotex.io/academics) for details.

## Developing

### Update Proto

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

## Sample

```swift
// create account from private key
let account = try Account(privateKey: "0806c458b262edd333a191e92f561aff338211ee3e18ab315a074a2d82aa343f")
let iotx = try IOTX(provider: "api.testnet.iotex.one:443", secure: true)

// query account meta
let response = try iotx.currentProvider().getAccount(Iotexapi_GetAccountRequest.with {
    $0.address = account.address
})
print(response)

// transfer IOTX
let hash = try iotx.transfer(TransferRequest(
    nonce: nil, gasLimit: 100000, gasPrice: "10000000000000", account: account,
    recipient: "io13zt8sznez2pf0q0hqdz2hyl938wak2fsjgdeml", amount: "1000000000000000000", payload: "".data(using: .utf8)!
))
print(hash)
```

