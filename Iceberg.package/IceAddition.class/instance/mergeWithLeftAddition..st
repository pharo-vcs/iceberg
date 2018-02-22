merging
mergeWithLeftAddition: anIceAddition 
	
	"If the addition is the same, I can just keep any of them."
	anIceAddition definition = self definition 
		ifTrue: [ ^ anIceAddition ].
		
	^ IceConflict left: anIceAddition right: self