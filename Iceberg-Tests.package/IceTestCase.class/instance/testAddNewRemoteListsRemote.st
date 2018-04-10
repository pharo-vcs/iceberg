tests-remotes
testAddNewRemoteListsRemote

	| remote |
	remote := self newRemoteNamed: 'origin'.
	repository addRemote: remote.
	
	self assert: (repository remotes includes: remote).