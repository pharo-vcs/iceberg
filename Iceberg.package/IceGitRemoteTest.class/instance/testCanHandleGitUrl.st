tests
testCanHandleGitUrl
	| url |
	self assert: (IceGitRemote canHandleUrl: 'git://github.com/pharo-vcs/iceberg.git').
	url := IceGitRemote new
				url: 'git://github.com/pharo-vcs/iceberg.git';
				parseUrl.
	self assert: url projectName equals: 'iceberg'.
	self assert: url owner equals: 'pharo-vcs'.
	self assert: url port equals: 9418.
	self assert: url path equals: OrderedCollection new.