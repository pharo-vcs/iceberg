enumerating
withErrorHandlingDo: aBlock
	aBlock
	on: IceError 
	do: [ :e | e acceptError: (IceTipInteractiveErrorVisitor on: self repositoryModel entity) ]