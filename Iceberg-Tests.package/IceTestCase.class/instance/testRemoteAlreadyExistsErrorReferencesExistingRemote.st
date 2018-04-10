tests-remotes
testRemoteAlreadyExistsErrorReferencesExistingRemote

	| remote remoteName |
	remoteName := 'origin'.
	remote := self newRemoteNamed: remoteName.
	repository addRemote: remote.
	
	remote := self newRemoteNamed: remoteName.
	[ repository addRemote: remote.
	self fail ]
		on: IceRemoteAlreadyExistsError
		do: [ :error | self assert: error remoteName equals: remoteName ]