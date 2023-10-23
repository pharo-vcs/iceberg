"
An IceFileRemoteTest is a test class for testing the behavior of IceFileRemote
"
Class {
	#name : 'IceFileRemoteTest',
	#superclass : 'TestCase',
	#category : 'Iceberg-Tests-Core-Remotes',
	#package : 'Iceberg-Tests',
	#tag : 'Core-Remotes'
}

{ #category : 'tests' }
IceFileRemoteTest >> testCanHandleFileUrl [
	| url |
	self assert: (IceGitFileRemote canHandleUrl: 'file:///Users/pharo/some-repo-name').
	url := IceGitFileRemote new
				url: 'file:///Users/pharo/some-repo-name';
				parseUrl.
	self assert: url projectName equals: 'some-repo-name'.
	self 
		assert: (url detailedInfo first value) 
		equals: (OSPlatform current isWindows 
			ifTrue: [ '\Users\pharo\some-repo-name' ]
			ifFalse: [ '/Users/pharo/some-repo-name' ]).
]

{ #category : 'tests' }
IceFileRemoteTest >> testCanHandleUnixPath [
	"git clone existing-repo tmp-repo produces a url = /..../existing-repo remote"
	| url |
	self assert: (IceGitFileRemote canHandleUrl: '/Users/pharo/some-repo-name').
	url := IceGitFileRemote new
				url: '/Users/pharo/some-repo-name';
				parseUrl.
	self assert: url projectName equals: 'some-repo-name'.
	self 
		assert: (url detailedInfo first value) 
		equals: (OSPlatform current isWindows 
			ifTrue: [ '\Users\pharo\some-repo-name' ]
			ifFalse: [ '/Users/pharo/some-repo-name' ]).
]
