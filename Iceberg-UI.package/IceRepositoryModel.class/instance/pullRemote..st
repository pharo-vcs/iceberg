actions remotes
pullRemote: aRemote
	[ self repository pullFrom: aRemote ]
	on: IceShouldCommitBeforePull 
	do: [ :e | e acceptError: (IceInteractiveErrorVisitor repository: self repository) ]