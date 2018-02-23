merging
mergeWithLeftModification: anIceModification 
	
	^ IceConflictingOperation
		left: anIceModification
		right: self