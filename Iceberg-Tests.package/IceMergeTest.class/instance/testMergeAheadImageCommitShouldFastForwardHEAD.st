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
	
	repository workingCopy addPackageNamed: self packageName1.
	repository workingCopy addPackageNamed: self packageName2.
	headCommit := repository commitWithMessage: 'First commit'.

	repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol.
	mergeCommit := repository commitWithMessage: 'Change 1'.

	repository branch commit: headCommit.

	self assert: headCommit equals: repository workingCopy referenceCommit parent.
	self assert: repository workingCopy referenceCommit equals: mergeCommit.
	self assert: repository workingCopy isModified not.
	
	repository workingCopy mergeCommit: mergeCommit.
	
	self assert: repository headCommit equals: mergeCommit.
	self assert: repository workingCopy referenceCommit equals: mergeCommit.
	self assert: repository workingCopy isModified not.