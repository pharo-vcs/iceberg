running
check: aNode forCritiquesDo: aBlock

	"Detect strange case where method node is nil"
	"Does not apply to defined accessors"
	(aNode methodNode notNil and: [ aNode methodNode pragmas anySatisfy: [ :pragma |
		pragma selector = IceLibgitRepository libgitRepositoryHandleAccessorPragmaSelector ]])
			ifTrue: [ ^ self ].

	"Only apply to 
		- reads to the handle variable
		- usages of defined accessors "
	((aNode isVariable and: [ aNode isRead and: [ aNode name = 'handle' ] ])
		or: [ aNode isMessage and: [ 
				(self libgitRepositoryHandleAccessorsForClass: aNode methodNode methodClass)
					anySatisfy: [ :accessor | accessor selector = aNode selector ] ] ])
		ifFalse: [ ^ self ].
	
	(aNode parents anySatisfy: [ :handleParent | 
		handleParent isBlock
			and: [ | blockParent | 
				blockParent := handleParent parent.
				blockParent isMessage and: [
					blockParent selector = IceLibgitRepository libgitErrorHandlerSelector ] ] ])
		ifFalse: [ aBlock cull: (self critiqueFor: aNode) ]