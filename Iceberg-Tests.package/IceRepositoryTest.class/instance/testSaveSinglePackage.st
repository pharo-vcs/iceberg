tests
testSaveSinglePackage
	| latestVersionNumber testClass | 
	repository loadPackage: packageName.
	latestVersionNumber := (repository latestVersion: packageName) versionNumber.

	testClass := Smalltalk at: #Test.
	testClass compile: 'nextVersion ^ latestVersionNumber + 1'.

	repository savePackage: packageName 
		withMessage: 'Automatic change done by unit tests'.

	self assert: ((repository latestVersion: packageName) versionNumber) 
		equals: latestVersionNumber + 1
