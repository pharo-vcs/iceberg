tests
testDiffContainsNewProject

	| diff |
	self repository workingCopy project: (IceProject onRepository: self repository withSourceDirectory: fixture subdirectory).
	
	diff := self repository workingCopyDiff.
	self assert: (diff tree / '.project') value isAddition