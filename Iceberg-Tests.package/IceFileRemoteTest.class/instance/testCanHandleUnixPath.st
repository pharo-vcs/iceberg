tests
testCanHandleUnixPath
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