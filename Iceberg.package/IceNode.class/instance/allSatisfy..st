enumerating
allSatisfy: aBlockClosure 
	
	(aBlockClosure value: self value)
		ifFalse: [ ^ false ].
		
	self childrenDo: [ :e |
		(e allSatisfy: aBlockClosure)
			ifFalse: [ ^ false ] ].

	^ true