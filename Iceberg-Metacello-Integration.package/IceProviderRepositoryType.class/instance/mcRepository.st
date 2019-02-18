accessing
mcRepository
	| baseRepo |
	
	self guessRegisteredRepository
		ifNotNil: [ :repo | 
			
			repo isValid ifTrue: [ ^ repo metacelloAdapter: self projectVersion ].
			"If the repo is not valid, we forget it and reget a new one. Because Metacello want to use it"
			repo forget.
		].
	
	baseRepo := self mcRepositoryClass location: self location.
	^ baseRepo getOrCreateIcebergRepository metacelloAdapter: self projectVersion