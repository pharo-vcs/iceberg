auxiliar
checkVersionNumber: expected
	| testClass |
	testClass := Smalltalk at: #Test.
	self assert: (testClass new versionNumber) equals: expected.
	self assert: (git latestVersion: packageName) versionNumber equals: expected.
