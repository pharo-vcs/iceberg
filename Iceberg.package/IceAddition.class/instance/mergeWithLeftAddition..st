merging
mergeWithLeftAddition: anIceAddition 
	
	"If the addition is the same, I can just keep any of them."
	anIceAddition definition = self definition 
		ifTrue: [ ^ anIceAddition ].
		
	^ (IceModification left: anIceAddition definition right: self definition)
		beConflict;
		yourself