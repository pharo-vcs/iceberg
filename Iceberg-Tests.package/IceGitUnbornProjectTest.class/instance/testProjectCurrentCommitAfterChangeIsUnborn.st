tests
testProjectCurrentCommitAfterChangeIsUnborn

	"Create a new commit"
	self repository workingCopy
		addPackageNamed: self packageName1 asSymbol;
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.
	self repository commitWithMessage: 'Another Invalid project commit'.

	self assert: self repository workingCopy project isUnborn.
	self assert: self repository headCommit project isInvalid.