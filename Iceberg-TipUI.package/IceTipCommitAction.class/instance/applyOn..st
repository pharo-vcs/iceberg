executing
applyOn: aRepository
	[
		self validateCanCommit.
		aRepository
			commitChanges: (diff copyWithOnly: items)
			withMessage: message.
		self isPublish ifTrue: [ aRepository push ] ]
	on: IceNothingToCommit, IceWorkingCopyDesyncronized  
	do: [ :e | e acceptError: (IceInteractiveErrorVisitor on: aRepository) ]	