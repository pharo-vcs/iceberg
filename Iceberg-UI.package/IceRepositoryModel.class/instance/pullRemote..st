actions remotes
pullRemote: aRemoteModel
	[ self repository pullFrom: aRemoteModel remote ]
	on: IceShouldCommitBeforePull 
	do: [ :e | e acceptError: (IceInteractiveErrorVisitor on: self repository) ]