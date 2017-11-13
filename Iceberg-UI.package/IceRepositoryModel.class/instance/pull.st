actions
pull
	[ self repository pull ]
	on: IceShouldCommitBeforePull 
	do: [ :e | e acceptError: (IceInteractiveErrorVisitor repository: self repository) ]