accessing
mcRepository
	| baseRepo |
	
	self guessRegisteredRepository
		ifNotNil: [ :repo | ^ repo metacelloAdapter ].
		
	baseRepo := self mcRepositoryClass location: self location.
	^ (Iceberg icebergRepositoriesURLs includes: baseRepo scpUrl)
		ifTrue: [ 
			"Do not use Iceberg to load iceberg code, 
			see https://github.com/pharo-vcs/iceberg/issues/168"
			baseRepo ]
		ifFalse: [  
			baseRepo getOrCreateIcebergRepository metacelloAdapter ]
		