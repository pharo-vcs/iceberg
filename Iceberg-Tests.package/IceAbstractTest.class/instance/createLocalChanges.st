auxiliar
createLocalChanges
	| testClass newVersionNumber | 
	testClass := Smalltalk at: #Test.
	newVersionNumber := testClass new versionNumber + 1.

	testClass compile: ('versionNumber ^ {1}' format: {newVersionNumber}).
	^ newVersionNumber.