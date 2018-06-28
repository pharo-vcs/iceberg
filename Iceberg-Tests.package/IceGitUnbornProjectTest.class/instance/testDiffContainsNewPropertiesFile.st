tests
testDiffContainsNewPropertiesFile

	| diff |
	self repository workingCopy project: (IceProject onRepository: self repository).
	
	diff := self repository workingCopyDiff.
	self assert: (diff codeSubdirectoryNode / '.properties') value isAddition