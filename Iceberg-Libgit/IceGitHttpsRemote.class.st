"
A remote repository created out of a HTTPS  url, such as 'https://github.com/npasserini/iceberg.git'.


"
Class {
	#name : 'IceGitHttpsRemote',
	#superclass : 'IceGitHttpRemote',
	#category : 'Iceberg-Libgit-Core',
	#package : 'Iceberg-Libgit',
	#tag : 'Core'
}

{ #category : 'accessing - defaults' }
IceGitHttpsRemote class >> defaultPort [
	"Returns the HTTPS default port"
	
	^443
]

{ #category : 'accessing - defaults' }
IceGitHttpsRemote class >> protocolID [
	"Return the protocol identifier"
	
	^'https'
]
