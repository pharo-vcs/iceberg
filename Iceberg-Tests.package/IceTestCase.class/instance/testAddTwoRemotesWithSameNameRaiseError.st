tests-remotes
testAddTwoRemotesWithSameNameRaiseError

	| remote |
	remote := self newRemoteNamed: 'origin'.
	repository addRemote: remote.
	
	remote := self newRemoteNamed: 'origin'.
	self should: [ repository addRemote: remote ] raise: IceRemoteAlreadyExistsError