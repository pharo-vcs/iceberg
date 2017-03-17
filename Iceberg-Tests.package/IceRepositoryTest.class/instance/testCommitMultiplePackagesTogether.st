tests - commit
testCommitMultiplePackagesTogether
	| oldCommits testClass newClass |
	repository loadPackage: packageName.
	repository loadPackage: otherPackageName.

	oldCommits := repository currentBranch commits size.
	
	testClass := Smalltalk at: #Test.
	testClass compile: ('newMethod').
	
	newClass := testClass 
		subclass: #IcebergTestClass2 
		instanceVariableNames: '' 
		classVariableNames: '' 
		package: otherPackageName.
	newClass compile: ('newMethod').
	
	repository commitPackagesWithMessage: 'Committing two packages together'.
	self assert: repository currentBranch commits size equals: oldCommits + 1.
	self assert: repository loadedCode referenceCommit equals: repository headCommit.

	{ packageName. otherPackageName } do: [ :name | | package version |
		package := repository packageNamed: name.
		version := repository loadedCode versionFor: package.
		self assert: version commit equals: repository headCommit.
	]
