accessing
remote
	^ remote ifNil: [ remote := self askRemote ]