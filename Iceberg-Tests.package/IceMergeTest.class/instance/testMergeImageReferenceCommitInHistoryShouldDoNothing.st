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
	
	repository workingCopy addPackageNamed: packageName1.
	repository workingCopy addPackageNamed: packageName2.
	mergeCommit := repository commitWithMessage: 'First commit'.

	repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: packageName1 asSymbol.
	headCommit := repository commitWithMessage: 'Change 1'.
	
	mergeCommit checkout.

	self assert: headCommit parent equals: repository workingCopy referenceCommit.
	self assert: mergeCommit equals: repository workingCopy referenceCommit.
	self assert: repository workingCopy isModified not.
	
	repository workingCopy mergeCommit: mergeCommit.
	
	self assert: headCommit parent equals: repository workingCopy referenceCommit.
	self assert: mergeCommit equals: repository workingCopy referenceCommit.
	self assert: repository workingCopy isModified not.