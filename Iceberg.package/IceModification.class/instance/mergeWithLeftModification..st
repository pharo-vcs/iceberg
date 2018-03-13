merging
mergeWithLeftModification: anIceModification 
	
	"If the modification is the same, I can just keep any of them."
	anIceModification leftDefinition = self leftDefinition 
		ifTrue: [ ^ IceNonConflictingOperation operation: anIceModification ].
		
	^ IceConflictingOperation left: anIceModification right: self