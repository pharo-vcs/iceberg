merge-cases
testImageBehindHeadShouldOnlyMergeInImage

	"If the image is behind HEAD and we want to merge HEAD we need to update the image to be in HEAD.
	
	(c2)  -  HEAD commit / merge commit
	 |
	 v
	(c1)  -  Image reference commit
	
	expected
	
	(c2)  -  HEAD commit / Image reference commit
	 |
	 v
	(c1) 
	
	(arrows meaning parent)
	"
	| referenceCommit headCommit mergeCommit |
	
	repository workingCopy addPackageNamed: self packageName1.
	repository workingCopy addPackageNamed: self packageName2.
	referenceCommit := repository commitWithMessage: 'First commit'.

	repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol.
	headCommit := mergeCommit := repository commitWithMessage: 'Change 1'.
	
	referenceCommit checkout.
	(repository branchNamed: 'master') switch.

	self assert: repository headCommit equals: headCommit.
	self assert: headCommit equals: mergeCommit.
	self assert: headCommit parent equals: repository workingCopy referenceCommit.
	self assert: repository workingCopy isModified not.
	
	repository workingCopy mergeCommit: mergeCommit.
	
	self assert: repository headCommit equals: headCommit.
	self assert: headCommit equals: repository workingCopy referenceCommit.
	self assert: repository workingCopy isModified not.