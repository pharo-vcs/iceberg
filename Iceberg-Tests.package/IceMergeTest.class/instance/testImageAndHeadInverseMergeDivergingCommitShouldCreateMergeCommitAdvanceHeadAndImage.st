merge-cases
testImageAndHeadInverseMergeDivergingCommitShouldCreateMergeCommitAdvanceHeadAndImage

	"If we want to merge the image into the head commit the usual thing would be to:
	  - checkout HEAD in the image
	  - do a normal merge.
	However, that would require lots of manual operations. Instead, we need to do an *Inverse merge*.
	We merge the changes from HEAD into the image, and create a merge commit with reverted parents into HEAD.
	Then we just need to update HEAD.
	
	(c2)  -  HEAD commit   (c3) - merge commit / Image reference commit
	 |                      |
	 v                      |
	(c1) <-------------------
	
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
	
	self workingCopy addPackageNamed: self packageName1.
	self workingCopy addPackageNamed: self packageName2.
	mergeBaseCommit := self repository commitWithMessage: 'First commit'.

	self repository workingCopy
		createClass: 'IceClassInHead'
		inPackage: self packageName1 asSymbol.
	headCommit := self repository commitWithMessage: 'Change 1'.
	
	((self repository branchNamed: 'master') commit: mergeBaseCommit) checkout.

	self repository workingCopy
		createClass: 'IceClassToMerge'
		inPackage: self packageName1 asSymbol.
	mergeCommit := self repository commitWithMessage: 'Change 2'.
	(self repository branchNamed: 'master') commit: headCommit.

	self assert: self repository workingCopy referenceCommit equals: mergeCommit.
	self assert: self repository headCommit equals: headCommit.
	self assert: self repository headCommit parent equals: mergeBaseCommit.
	self assert: mergeCommit parent equals: mergeBaseCommit.
	self assert: self repository workingCopy isModified not.
	
	self repository workingCopy mergeCommit: mergeCommit.
	
	self assert: self repository headCommit parent equals: headCommit.
	self assert: self repository workingCopy referenceCommit equals: self repository headCommit.
	self assert: self repository headCommit ancestors size equals: 2.
	self assert: (self repository headCommit ancestors includes: mergeCommit).
	self assert: self repository workingCopy isModified not.