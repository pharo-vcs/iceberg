merging
mergeWithLeftModification: anIceModification 
	
	^ IceConflict
		left: anIceModification
		right: self