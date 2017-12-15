tests
testCanHandleGitUrlPort
	| url |
	self assert: (IceGitSshRemote canHandleUrl: 'git://github.com:80/pharo-vcs/iceberg').
	url := IceGitSshRemote new
				url: 'git://github.com:8080/pharo-vcs/iceberg';
				parseUrl.
	self assert: url projectName equals: 'iceberg'.
	self assert: url owner equals: 'pharo-vcs'.
	self assert: url port equals: 9418.
	self assert: url path equals: OrderedCollection new.