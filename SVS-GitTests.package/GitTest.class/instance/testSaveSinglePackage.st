tests
testSaveSinglePackage
	| latestVersionNumber testClass | 
	git loadPackage: packageName.
	latestVersionNumber := (git latestVersion: packageName) versionNumber.

	testClass := Smalltalk at: #Test.
	testClass compile: 'nextVersion ^ latestVersionNumber + 1'.

	git savePackage: packageName.

	self assert: ((git latestVersion: packageName) versionNumber) 
		equals: latestVersionNumber + 1
