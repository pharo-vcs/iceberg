merge-cases
testImageAndHeadMergeDivergingCommitShouldCreateMergeCommitAdvanceHeadAndImage

	"If the image and HEAD diverted from the merge commit, we need to create a merge commit and advance both HEAD and the image to it.
	The case with no conflicts should do the merge automatically.
	The merge commmit should have two parents. The first parent should be HEAD.
	
	(c2)  -  HEAD commit / Image reference commit   (c3) - merge commit
	 |                                               |
	 v                                               |
	(c1) <--------------------------------------------
	
	expected
	
	(c4) -  HEAD commit / Image reference commit
	 |--------
    |       |
	 v       v
	(c2)    (c3)
	 |       |
	 v       |
	(c1) <---- 
	
	(arrows meaning parent)
	"
	| headCommit mergeCommit mergeBaseCommit |
	
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy addPackageNamed: self packageName2.
	mergeBaseCommit := self repository commitWithMessage: 'First commit'.

	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol.
	mergeCommit := self repository commitWithMessage: 'Change 1'.
	
	((self repository branchNamed: 'master') commit: mergeBaseCommit) checkout.

	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting2'
		inPackage: self packageName1 asSymbol.
	headCommit := self repository commitWithMessage: 'Change 2'.

	self assert: self repository headCommit equals: self repository workingCopy referenceCommit.
	self assert: self repository headCommit equals: headCommit.
	self assert: self repository headCommit parent equals: mergeBaseCommit.
	self assert: mergeCommit parent equals: mergeBaseCommit.
	self deny: self repository workingCopy isModified.
	
	self repository workingCopy mergeCommit: mergeCommit.
	
	self assert: self repository headCommit parent equals: headCommit.
	self assert: self repository workingCopy referenceCommit equals: self repository headCommit.
	self assert: self repository headCommit ancestors size equals: 2.
	self assert: (self repository headCommit ancestors includes: mergeCommit).
	self deny: self repository workingCopy isModified.