tests - versions
testIncomingVersions
	| package | 
	package := repository packageNamed: packageName.

	"1. - Preparation: checkout the all-but-last version"
	repository head commit parent checkoutPackageNamed: packageName.

	"2. - Exercise"
	self assert: package incomingCommits size equals: 1
