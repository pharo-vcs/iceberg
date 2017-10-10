tests
testCanHandleHttpUrlPort
	| url |
	self assert: (IceHttpRemote canHandleUrl: 'http://github.com:80/pharo-vcs/iceberg').
	url := IceHttpRemote new
				url: 'http://github.com:8080/pharo-vcs/iceberg';
				parseUrl.
	self assert: url projectName equals: 'iceberg'.
	self assert: url owner equals: 'pharo-vcs'.
	self assert: url port equals: 8080.
	self assert: url path equals: OrderedCollection new.