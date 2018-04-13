merge-cases
testTrimergeShouldRaiseError

	"If the image, HEAD and merge commit are three different commits, we should avoid merging.
	
	(c3)  -  HEAD commit
	 |
	 v
	(c2)  -  merge commit
	 |
	 v
	(c1)  -  Image reference commit
	
	expected
	
	 * IceMergeAborted
	
	(arrows meaning parent)
	"
	| referenceCommit headCommit mergeCommit |
	
	repository workingCopy addPackageNamed: self packageName1.
	repository workingCopy addPackageNamed: self packageName2.
	referenceCommit := repository commitWithMessage: 'First commit'.

	repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol.
	mergeCommit := repository commitWithMessage: 'Change 1'.
	
	repository workingCopy
		createClass: 'IceGeneratedClassForTesting2'
		inPackage: self packageName1 asSymbol.
	headCommit := repository commitWithMessage: 'Change 2'.
	
	referenceCommit checkout.
	headCommit switch.

	self assert: headCommit parent equals: mergeCommit.
	self assert: mergeCommit parent equals: repository workingCopy referenceCommit.
	self assert: repository workingCopy isModified not.
	
	self
		should: [ repository workingCopy mergeCommit: mergeCommit ]
		raise: IceMergeAborted.
	
	self assert: headCommit parent equals: mergeCommit.
	self assert: mergeCommit parent equals: repository workingCopy referenceCommit.
	self assert: repository workingCopy isModified not.