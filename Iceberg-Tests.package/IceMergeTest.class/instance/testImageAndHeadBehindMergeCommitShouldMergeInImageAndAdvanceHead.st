merge-cases
testImageAndHeadBehindMergeCommitShouldMergeInImageAndAdvanceHead

	"If the image and HEAD are behind the commit to merge, we need to advance HEAD and update the image so they correspond.
	
	(c2)  -  mergeCommit
	 |
	 v
	(c1)  -  HEAD commit / Image reference commit
	
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
	headCommit := repository commitWithMessage: 'First commit'.

	repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: packageName1 asSymbol.
	mergeCommit := mergeCommit := repository commitWithMessage: 'Change 1'.
	
	((repository branchNamed: 'master') commit: headCommit) checkout.

	self assert: repository headCommit equals: headCommit.
	self assert: mergeCommit parent equals: headCommit.
	self assert: mergeCommit parent equals: repository workingCopy referenceCommit.
	self assert: repository workingCopy isModified not.
	
	repository workingCopy mergeCommit: mergeCommit.
	
	self assert: repository headCommit equals: mergeCommit.
	self assert: repository workingCopy referenceCommit equals: mergeCommit.
	self assert: repository workingCopy isModified not.