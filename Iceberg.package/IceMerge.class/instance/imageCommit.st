accessing
imageCommit
	
	^ imageCommit ifNil: [ imageCommit := repository workingCopy referenceCommit ]