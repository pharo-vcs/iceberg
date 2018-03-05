private
withErrorHandlingDo: aBlock
	aBlock
	on: IceError, IceWarning
	do: [ :e | e acceptError: (IceInteractiveErrorVisitor on: self repository) ]