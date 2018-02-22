merging
mergeWithLeftModification: anIceModification 
	
	^ (IceRemoval definition: anIceModification leftDefinition)
		beConflict;
		yourself