tests
testIncommingVersions
	| package | 
	package := repository packageNamed: packageName.

	"1. - Preparation: checkout the all-but-last version"
	package versions second load.

	"2. - Exercise"
	self assert: package incommingVersions size equals: 1
