accessing
mcRepository
	| baseRepo |
	
	self guessRegisteredRepository
		ifNotNil: [ :repo | ^ repo metacelloAdapter ].
	
	baseRepo := MCBitbucketRepository location: self location.
	^ baseRepo getOrCreateIcebergRepository metacelloAdapter