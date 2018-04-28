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
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy addPackageNamed: self packageName2.
	referenceCommit := self repository commitWithMessage: 'First commit'.
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol.
	mergeCommit := self repository commitWithMessage: 'Change 1'.
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting2'
		inPackage: self packageName1 asSymbol.
	headCommit := self repository commitWithMessage: 'Change 2'.
	referenceCommit adopt.
	self assert: headCommit parent equals: mergeCommit.
	self assert: mergeCommit parent equals: self repository workingCopy referenceCommit.
	self
		should: [ "Experimental issue. If we merge and we have dirty package we should just resume"
			[ self repository workingCopy mergeCommit: mergeCommit ]
				on: Warning
				do: #resume ]
		raise: IceMergeAborted.
	self assert: headCommit parent equals: mergeCommit.
	self assert: mergeCommit parent equals: self repository workingCopy referenceCommit