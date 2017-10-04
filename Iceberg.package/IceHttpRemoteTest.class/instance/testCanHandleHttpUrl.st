tests
testCanHandleHttpUrl
	| url |
	self assert: (IceHttpRemote canHandleUrl: 'http://github.com/pharo-vcs/iceberg.git').
	url := IceHttpRemote new
				url: 'http://github.com/pharo-vcs/iceberg.git';
				parseUrl.
	self assert: url projectName equals: 'iceberg'.
	self assert: url owner equals: 'pharo-vcs'.
	self assert: url port equals: 80.
	self assert: url path equals: OrderedCollection new.