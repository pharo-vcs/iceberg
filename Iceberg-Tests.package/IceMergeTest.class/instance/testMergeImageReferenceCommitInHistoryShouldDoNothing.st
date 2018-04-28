merge-cases
testMergeImageReferenceCommitInHistoryShouldDoNothing

	"If the image corresponds to the merge commit and is in the history of the head commit, the merge should be ignored.
	
	(c2)  -  HEAD commit
	 |
	 v
	(c1)  -  Image reference commit / merge commit
	
	expected
	
	(c2)  -  HEAD commit
	 |
	 v
	(c1)  -  Image reference commit
	
	(arrows meaning parent)
	"
	| headCommit mergeCommit |
	
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy addPackageNamed: self packageName2.
	mergeCommit := self repository commitWithMessage: 'First commit'.

	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol.
	headCommit := self repository commitWithMessage: 'Change 1'.
	
	mergeCommit checkout.

	self assert: headCommit parent equals: self repository workingCopy referenceCommit.
	self assert: mergeCommit equals: self repository workingCopy referenceCommit.
	self assert: self repository workingCopy isModified not.
	
	self repository workingCopy mergeCommit: mergeCommit.
	
	self assert: headCommit parent equals: self repository workingCopy referenceCommit.
	self assert: mergeCommit equals: self repository workingCopy referenceCommit.
	self assert: self repository workingCopy isModified not.