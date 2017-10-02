tests
testRemoveFromEnclosingStartEnd
	| parser |
	
	parser := ShoalParser new.
	self 
		assert: (parser 
			removeFrom: '[ ^ self ]'  
			enclosingStart: $[ 
			end: $])
		equals: '^ self'.
		
	self 
		assert: (parser 
			removeFrom: '[ 
	^ self ]'  
			enclosingStart: $[ 
			end: $])
		equals: Character tab asString, '^ self'.
	
	self 
		assert: (parser 
			removeFrom: '[ 
	^ self
	]'
			enclosingStart: $[ 
			end: $])
		equals: Character tab asString, '^ self'.
		
	
	self 
		assert: (parser 
			removeFrom: '[ 

	^ self

]'
			enclosingStart: $[ 
			end: $])
		equals: '
	^ self
'