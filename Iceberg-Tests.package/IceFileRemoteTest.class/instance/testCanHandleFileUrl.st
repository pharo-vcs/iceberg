tests
testCanHandleFileUrl
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