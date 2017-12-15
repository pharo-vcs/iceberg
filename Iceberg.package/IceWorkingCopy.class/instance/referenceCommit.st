accessing
referenceCommit
	^ referenceCommits ifNil: [ 
		self halt.
		referenceCommit := self computeReferenceCommit ]