tests
testProjectOlderCommitIsInvalid

	"Create a new commit"
	self repository workingCopy
		addPackageNamed: self packageName1 asSymbol;
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.	
	self repository commitWithMessage: 'Another Invalid project commit'.

	self repository workingCopy project: (IceBasicProject onRepository: self repository withSourceDirectory: 'test').
	self assert: self repository headCommit parent project sourceDirectory equals: 'test'