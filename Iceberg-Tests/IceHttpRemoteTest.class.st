"
Tests for IceHTTPRemote
"
Class {
	#name : 'IceHttpRemoteTest',
	#superclass : 'TestCase',
	#category : 'Iceberg-Tests-Core-Remotes',
	#package : 'Iceberg-Tests',
	#tag : 'Core-Remotes'
}

{ #category : 'private - defaults' }
IceHttpRemoteTest >> defaultTestClass [
	"Return the default test class"
	
	^IceGitHttpRemote
]

{ #category : 'private - defaults' }
IceHttpRemoteTest >> protocolID [
	"Return the protocol identifier"
	
	^self defaultTestClass protocolID
]

{ #category : 'private - utilities' }
IceHttpRemoteTest >> protocolURLFor: aString [

	^IceGitRemote url: self protocolID, '://', aString
	

]

{ #category : 'tests - providers' }
IceHttpRemoteTest >> testBitBucketURL [
	|remote|
	remote := self protocolURLFor: 'bitbucket.org/owner/repo.git'.
	self 
		assert: remote host equals: 'bitbucket.org';
		assert: remote owner equals: 'owner';	
		assert: remote path isEmpty;
		assert: remote projectName equals: 'repo'
]

{ #category : 'tests' }
IceHttpRemoteTest >> testCanHandleProtocol [

	self assert: (self defaultTestClass canHandleUrl: self protocolID ,'://')
]

{ #category : 'tests' }
IceHttpRemoteTest >> testFullURL [
	| remote |
	remote := self protocolURLFor: 'user@hostname.com:1234/subpath1/subpath2/owner/repo.git'.
	self
		assert: remote host equals: 'hostname.com';
		assert: remote port equals: 1234;
		assert: remote owner equals: 'owner';
		assert: remote projectName equals: 'repo'
]

{ #category : 'tests - providers' }
IceHttpRemoteTest >> testGitHubURL [
	|remote|
	remote := self protocolURLFor: 'github.com/owner/repo.git'.
	self 
		assert: remote host equals: 'github.com';
		assert: remote owner equals: 'owner';	
		assert: remote path isEmpty;
		assert: remote projectName equals: 'repo'
]

{ #category : 'tests' }
IceHttpRemoteTest >> testLocalhostRepo [
	|remote|
	remote := self protocolURLFor: 'hostname/owner/repo.git'.
	self 
		assert: remote host equals: 'hostname';
		assert: remote owner equals: 'owner';		
		assert: remote port equals: self defaultTestClass defaultPort;	
		assert: remote projectName equals: 'repo'
]

{ #category : 'tests' }
IceHttpRemoteTest >> testURLWithDeepPath [
	|remote|
	remote := self protocolURLFor: 'hostname:8080/sub1/sub2/sub3/owner/repo.git'.
	self 
		assert: remote path size equals: 3;
		assert: remote path first equals: 'sub1';
		assert: remote path second equals: 'sub2';	
		assert: remote path third equals: 'sub3'
]

{ #category : 'tests' }
IceHttpRemoteTest >> testURLWithEmpty [
	|remote|
	remote := self protocolURLFor: 'hostname:8080/owner/repo.git'.
	self 
		assert: remote path isEmpty 
]

{ #category : 'tests' }
IceHttpRemoteTest >> testURLWithSinglePath [
	|remote|
	remote := self protocolURLFor: 'hostname:8080/path/owner/repo.git'.
	self 
		assert: remote path size equals: 1;
		assert: remote path first equals: 'path'
]
