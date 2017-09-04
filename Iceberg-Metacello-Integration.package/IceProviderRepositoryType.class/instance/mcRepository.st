accessing
mcRepository
	| baseRepo |
	
	self guessRegisteredRepository
		ifNotNil: [ :repo | ^ repo metacelloAdapter ].
	
	baseRepo := MCGitHubRepository location: self location.
	^ baseRepo getOrCreateIcebergRepository metacelloAdapter