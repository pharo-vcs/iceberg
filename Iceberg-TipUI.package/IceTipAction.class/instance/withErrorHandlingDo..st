private
withErrorHandlingDo: aBlock
	aBlock
	on: IceError, IceWarning
	do: [ :e | e acceptError: (IceTipInteractiveErrorVisitor on: self repository) ].
