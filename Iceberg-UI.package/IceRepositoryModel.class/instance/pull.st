actions
pull
	[ self repository pull ]
	on: IceShouldCommitBeforePull 
	do: [ :e | e acceptError: (IceInteractiveErrorVisitor on: self repository) ]