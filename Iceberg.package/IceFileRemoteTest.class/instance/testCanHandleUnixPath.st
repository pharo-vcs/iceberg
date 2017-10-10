tests
testCanHandleUnixPath
	"git clone existing-repo tmp-repo produces a url = /..../existing-repo remote"
	| url |
	self assert: (IceFileRemote canHandleUrl: '/Users/pharo/some-repo-name').
	url := IceFileRemote new
				url: '/Users/pharo/some-repo-name';
				parseUrl.
	self assert: url projectName equals: 'some-repo-name'.
	self assert: (url detailedInfo first value) equals: '/Users/pharo/some-repo-name'.