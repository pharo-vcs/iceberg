auxiliar
saveNewVersion
	| testClass currentVersionNumber |
	testClass := Smalltalk at: #Test.
	currentVersionNumber := testClass new versionNumber.

	testClass compile: ('versionNumber ^ {1}' format: {currentVersionNumber + 1}).
	repository commitPackagesWithMessage: ('Saving version {1}' format: {currentVersionNumber + 1}).
