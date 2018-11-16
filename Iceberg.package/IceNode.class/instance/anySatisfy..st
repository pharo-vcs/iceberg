enumerating
anySatisfy: aBlockClosure 
	
	(aBlockClosure value: self value)
		ifTrue: [ ^ true ].
		
	self childrenDo: [ :e |
		(e anySatisfy: aBlockClosure)
			ifTrue: [ ^ true ] ].

	^ false