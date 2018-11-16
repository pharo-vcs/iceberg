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
	
	self workingCopy addPackageNamed: self packageName1.
	self workingCopy addPackageNamed: self packageName2.
	headCommit := self repository commitWithMessage: 'First commit'.

	self workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol.
	mergeCommit := mergeCommit := self repository commitWithMessage: 'Change 1'.
	
	((self repository branchNamed: 'master') commit: headCommit) checkout.

	self assert: self repository headCommit equals: headCommit.
	self assert: mergeCommit parent equals: headCommit.
	self assert: mergeCommit parent equals: self workingCopy referenceCommit.
	self assert: self workingCopy isModified not.
	
	self workingCopy mergeCommit: mergeCommit.
	
	self assert: self repository headCommit equals: mergeCommit.
	self assert: self workingCopy referenceCommit equals: mergeCommit.
	self assert: self workingCopy isModified not.