comparing
= another
	self species = another species ifFalse: [ ^ false ].
	
	"If I have both updationCommits and are equal, we are the same version."
	(self updationCommit notNil and: [ self updationCommit = another updationCommit]) 
		ifTrue: [ ^ true ].
		
	"If not, look for actual origination commits and compare them."
	^ self commitId = another commitId.