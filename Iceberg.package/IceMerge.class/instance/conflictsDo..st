enumerating
conflictsDo: aBlockClosure 
	
	mergeTree do: [ :each |
		each isConflict ifTrue: [ aBlockClosure value: each value ] ]