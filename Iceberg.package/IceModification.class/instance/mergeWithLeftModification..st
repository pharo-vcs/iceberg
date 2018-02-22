merging
mergeWithLeftModification: anIceModification 
	
	"If the modification is the same, I can just keep any of them."
	anIceModification leftDefinition = self leftDefinition 
		ifTrue: [ ^ anIceModification ].
		
	^ IceConflict left: anIceModification right: self