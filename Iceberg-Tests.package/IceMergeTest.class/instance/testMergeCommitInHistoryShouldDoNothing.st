merge-cases
testMergeCommitInHistoryShouldDoNothing

	"If the image corresponds to the head commit and the commit we want to merge is in the history of the head commit, the merge should be ignored.
	
	(c2)  -  HEAD commit / Image reference commit
	 |
	 v
	(c1)  -  merge commit
	
	expected
	
	(c2)  -  HEAD commit / Image reference commit
	 |
	 v
	(c1)
	
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

	self assert: headCommit equals: repository workingCopy referenceCommit.
	self assert: headCommit parent equals: mergeCommit.
	self assert: repository workingCopy isModified not.
	
	repository workingCopy mergeCommit: mergeCommit.
	
	self assert: repository headCommit equals: headCommit.
	self assert: headCommit equals: repository workingCopy referenceCommit.
	self assert: repository workingCopy isModified not.