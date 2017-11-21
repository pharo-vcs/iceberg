actions
pull: aRepository then: aBlock
	[ aRepository pull ]
	on: IceShouldCommitBeforePull 
	do: [ :e | e acceptError: (IceInteractiveErrorVisitor repository: aRepository) ].
	
	aBlock value