Pod::Spec.new do |s|
  s.name = 'iotex-antenna-swift'
  s.version = '0.0.1'
  s.license     = { :type => 'Apache License, Version 2.0',}

  s.summary = 'Swift gRPC code generator plugin and runtime library'
  s.homepage = 'https://www.iotex.io/'
  s.authors  = { 'iotex' => ''}
  s.source = { :git => 'git@github.com:iotexproject/iotex-antenna-swift.git', :tag => s.version }

  s.swift_version = "5.0"
  s.requires_arc = true
  s.ios.deployment_target = '10.0'
  s.osx.deployment_target = '10.10'

  s.source_files = 'Sources/**/*.swift'
  
  s.resource = 'proto/**/*.proto'

  s.dependency 'secp256k1.swift', '~> 0.1'
  s.dependency 'CryptoSwift', '~> 1.0'
  s.dependency 'SwiftGRPC'
  s.dependency 'BigInt', '~> 4.0'
end
