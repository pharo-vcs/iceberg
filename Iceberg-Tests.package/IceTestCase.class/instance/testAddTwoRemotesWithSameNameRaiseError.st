tests-remotes
testAddTwoRemotesWithSameNameRaiseError

	| remote |
	remote := self newRemoteNamed: 'origin'.
	self repository addRemote: remote.
	
	remote := self newRemoteNamed: 'origin'.
	self should: [ self repository addRemote: remote ] raise: IceRemoteAlreadyExistsError