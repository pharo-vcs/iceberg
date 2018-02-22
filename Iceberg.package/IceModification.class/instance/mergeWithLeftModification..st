merging
mergeWithLeftModification: anIceModification 
	
	"If the modification is the same, I can just keep any of them."
	anIceModification newDefinition = self newDefinition 
		ifTrue: [ ^ anIceModification ].
		
	^ IceConflict left: anIceModification newDefinition right: self newDefinition