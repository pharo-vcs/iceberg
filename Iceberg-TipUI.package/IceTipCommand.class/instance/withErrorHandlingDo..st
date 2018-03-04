enumerating
withErrorHandlingDo: aBlock
	aBlock
	on: IceError 
	do: [ :e | e acceptError: (IceInteractiveErrorVisitor on: self repositoryModel entity) ]