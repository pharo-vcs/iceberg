visiting
visitConflictingOperation: anIceConflictingOperation 
	
	anIceConflictingOperation isResolved
		ifFalse: [ self error: 'Cannot apply a non resolved conflict' ].
		
	^ anIceConflictingOperation chosenOperation accept: self