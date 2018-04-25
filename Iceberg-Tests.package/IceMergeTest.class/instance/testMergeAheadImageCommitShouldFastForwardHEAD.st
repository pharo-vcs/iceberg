merge-cases
testMergeAheadImageCommitShouldFastForwardHEAD

	"If the image corresponds to the head commit and the commit we want to merge is in the history of the head commit, the merge should be ignored.
	
	(c2)  -  merge commit / Image reference commit
	 |
	 v
	(c1)  -  HEAD commit

	expected:
	
	(c2)  -  HEAD commit / Image reference commit
	 |
	 v
	(c1)
	
	(arrows meaning parent)
	"
	| headCommit mergeCommit |
	
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy addPackageNamed: self packageName2.
	headCommit := self repository commitWithMessage: 'First commit'.

	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol.
	mergeCommit := self repository commitWithMessage: 'Change 1'.

	self repository branch commit: headCommit.

	self assert: headCommit equals: self repository workingCopy referenceCommit parent.
	self assert: self repository workingCopy referenceCommit equals: mergeCommit.
	self assert: self repository workingCopy isModified not.
	
	self repository workingCopy mergeCommit: mergeCommit.
	
	self assert: self repository headCommit equals: mergeCommit.
	self assert: self repository workingCopy referenceCommit equals: mergeCommit.
	self assert: self repository workingCopy isModified not.