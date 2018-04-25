tests-remotes
testAddNewRemoteListsRemote

	| remote |
	remote := self newRemoteNamed: 'origin'.
	self repository addRemote: remote.
	
	self assert: (self repository remotes includes: remote).