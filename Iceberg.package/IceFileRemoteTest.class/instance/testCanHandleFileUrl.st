tests
testCanHandleFileUrl
	| url |
	self assert: (IceFileRemote canHandleUrl: 'file:///Users/pharo/some-repo-name').
	url := IceFileRemote new
				url: 'file:///Users/pharo/some-repo-name'.
	self assert: url projectName equals: 'some-repo-name'.
	self assert: (url detailedInfo first value) equals: '/Users/pharo/some-repo-name'.