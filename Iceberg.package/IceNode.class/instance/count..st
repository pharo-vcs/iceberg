enumerating
count: aBlockClosure 
	
	| count |
	count := 0.
	(aBlockClosure value: self value)
		ifTrue: [ count := 1 ].
	
	self childrenDo: [ :each | count := count + (each count: aBlockClosure) ].
	^ count