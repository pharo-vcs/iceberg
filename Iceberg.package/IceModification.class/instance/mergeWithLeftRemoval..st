merging
mergeWithLeftRemoval: anIceRemoval 
	
	^ (IceRemoval definition: self newDefinition)
		beConflict;
		yourself