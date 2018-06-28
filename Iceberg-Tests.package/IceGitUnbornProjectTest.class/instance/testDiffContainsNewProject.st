tests
testDiffContainsNewProject

	| diff |
	self repository workingCopy project: (IceProject onRepository: self repository).
	
	diff := self repository workingCopyDiff.
	self assert: (diff tree / '.project') value isAddition