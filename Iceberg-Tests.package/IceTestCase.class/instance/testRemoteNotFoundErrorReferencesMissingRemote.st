tests-remotes
testRemoteNotFoundErrorReferencesMissingRemote

	[ repository fetch.
	self fail ]
		on: IceRemoteNotFoundError
		do: [ :error | self assert: error remoteName equals: 'origin' ]