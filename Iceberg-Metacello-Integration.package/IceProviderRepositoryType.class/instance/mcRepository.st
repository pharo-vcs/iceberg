accessing
mcRepository
	| baseRepo |
	
	self guessRegisteredRepository
		ifNotNil: [ :repo | ^ repo metacelloAdapter ].
	
	baseRepo := self mcRepositoryClass location: self location.
	^ baseRepo getOrCreateIcebergRepository metacelloAdapter