merging
mergeWithLeftAddition: anIceAddition 
	
	"If the addition is the same, I can just keep any of them."
	anIceAddition definition = self definition 
		ifTrue: [ ^ IceNonConflictingOperation operation: anIceAddition ].
		
	^ IceConflictingOperation left: anIceAddition right: self