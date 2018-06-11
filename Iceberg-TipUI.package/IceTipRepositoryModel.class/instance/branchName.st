accessing
branchName
	self entity isMissing ifTrue: [ ^ self class unknownBranchLabel ].
	
	^ self entity head description.