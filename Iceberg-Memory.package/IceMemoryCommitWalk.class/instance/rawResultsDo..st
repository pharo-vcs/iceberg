iterating
rawResultsDo: aBlockClosure 
	
	| current |
	[ queue notEmpty ] whileTrue: [
		current := queue removeFirst.
		queue addAllLast: current ancestors.
		aBlockClosure value: current.
	]