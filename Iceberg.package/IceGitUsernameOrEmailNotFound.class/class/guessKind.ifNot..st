accessing
guessKind: anError ifNot: notBlock 
	(anError messageText asLowercase = 'Config value ''user.name'' was not found' asLowercase
		or: [ anError messageText asLowercase = 'Config value ''user.email'' was not found' asLowercase
		or: [ anError messageText asLowercase = 'Failed to parse signature - Signature cannot have an empty name or email' asLowercase ] ])
		ifTrue: [ ^ self signal ].
	notBlock value