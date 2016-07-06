tests
testIncommingVersions
	| package | 
	"1. - Preparation: checkout the all-but-last version"
	self gitCommand: 'checkout master^'.
	repository loadPackage: packageName.
	self gitCommand: 'checkout master'.

	"2. - Exercise"
	package := repository packageNamed: packageName.
	self assert: package incommingVersions size equals: 1
