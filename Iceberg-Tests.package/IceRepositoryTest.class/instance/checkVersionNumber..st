auxiliar
checkVersionNumber: expected
	| testClass |
	testClass := Smalltalk at: #Test.
	self assert: (testClass new versionNumber) equals: expected.
	self assert: (repository latestVersion: packageName) versionNumber equals: expected.
