"
Test for IceHttpsRemoteTest
"
Class {
	#name : 'IceHttpsRemoteTest',
	#superclass : 'IceHttpRemoteTest',
	#category : 'Iceberg-Tests-Core-Remotes',
	#package : 'Iceberg-Tests',
	#tag : 'Core-Remotes'
}

{ #category : 'private - defaults' }
IceHttpsRemoteTest >> defaultTestClass [
	"Return the default test class"
	
	^IceGitHttpsRemote
]

{ #category : 'tests' }
IceHttpsRemoteTest >> testSameRemoteReference [

	| r1 r2 |
	r1 := IceGitRemote url: 'https://github.com/owner/repo.git'.
	r2 := IceGitRemote url: 'git@github.com:owner/repo.git'.	
	self assert: (r1 referencesSameRemoteLocationAs: r2)
]

{ #category : 'tests' }
IceHttpsRemoteTest >> testSameRemoteReferenceWithoutGitExtension [

	| r1 r2 |
	r1 := IceGitRemote url: 'https://github.com/owner/repo'.
	r2 := IceGitRemote url: 'git@github.com:owner/repo.git'.	
	self assert: (r1 referencesSameRemoteLocationAs: r2)
]
