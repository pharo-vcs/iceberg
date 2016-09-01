tests - commit
testCommitMultiplePackagesTogether
	| oldCommits testClass newClass |
	repository loadPackage: packageName.
	repository loadPackage: otherPackageName.

	oldCommits := repository commits size.
	
	testClass := Smalltalk at: #Test.
	testClass compile: ('newMethod').
	
	newClass := testClass 
		subclass: #IcebergTestClass2 
		instanceVariableNames: '' 
		classVariableNames: '' 
		package: packageName.
	newClass compile: ('newMethod').
	
	repository commitWithMessage: 'Committing two packages together'.
	self assert: repository commits size equals: oldCommits + 1