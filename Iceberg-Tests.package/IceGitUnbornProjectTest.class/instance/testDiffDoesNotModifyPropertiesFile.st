tests
testDiffDoesNotModifyPropertiesFile

	| diff |
	self repository workingCopy project: (IceBasicProject onRepository: self repository withSourceDirectory: fixture subdirectory).
	diff := self repository workingCopyDiff.
	self deny: (diff codeSubdirectoryNode includesKey: '.properties')