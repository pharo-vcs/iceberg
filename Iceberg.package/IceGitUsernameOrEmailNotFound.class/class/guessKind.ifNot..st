accessing
guessKind: anError ifNot: notBlock 
	(anError messageText = 'Config value ''user.name'' was not found' 
		or: [ anError messageText = 'Config value ''user.email'' was not found' 
		or: [ anError messageText = 'Failed to parse signature - Signature cannot have an empty name or email' ] ])
		ifTrue: [ self signal ].
	notBlock value