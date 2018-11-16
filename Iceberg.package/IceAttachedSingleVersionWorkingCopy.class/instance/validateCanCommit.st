validating
validateCanCommit
	
	self isDetached
		ifTrue: [ IceWorkingCopyDesyncronized signal ]