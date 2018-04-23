validating
validateCanCommit
	
	self workingCopy referenceCommit first = repository head commit
		ifFalse: [ IceWorkingCopyDesyncronized signal ]