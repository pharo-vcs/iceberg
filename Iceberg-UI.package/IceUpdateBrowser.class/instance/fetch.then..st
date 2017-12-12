actions
fetch: aRepository then: aBlock
	[ aRepository fetch ]
	on: IceNoRemote, IceAuthenticationError
	do: [ :e | e acceptError: (IceInteractiveErrorVisitor repository: aRepository) ].
	
	aBlock value