"
A remote repository created out of a HTTP  url, such as 'http://localhost/owner/repository.git'.


"
Class {
	#name : 'IceGitHttpRemote',
	#superclass : 'IceGitNetworkRemote',
	#category : 'Iceberg-Libgit-Core',
	#package : 'Iceberg-Libgit',
	#tag : 'Core'
}

{ #category : 'testing' }
IceGitHttpRemote class >> canHandleUrl: aRepositoryUrl [
	^ (aRepositoryUrl beginsWith: self protocolID, '://') 
]

{ #category : 'accessing - defaults' }
IceGitHttpRemote class >> defaultPort [
	"Returns the HTTP default port"
	
	^80
]

{ #category : 'accessing - defaults' }
IceGitHttpRemote class >> protocolID [
	"Return the protocol identifier"
	
	^'http'
]
