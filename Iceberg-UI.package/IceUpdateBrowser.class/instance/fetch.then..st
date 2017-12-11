actions
fetch: aRepository then: aBlock
	[ aRepository fetch ]
	on: IceNoRemote 
	do: [ :e | e acceptError: (IceInteractiveErrorVisitor repository: aRepository) ].
	
	aBlock value