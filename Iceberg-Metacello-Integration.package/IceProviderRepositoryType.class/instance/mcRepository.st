accessing
mcRepository
	| baseRepo |
	
	self guessRegisteredRepository
		ifNotNil: [ :repo | ^ repo metacelloAdapter: self projectVersion  ].
	
	baseRepo := self mcRepositoryClass location: self location.
	^ baseRepo getOrCreateIcebergRepository metacelloAdapter: self projectVersion