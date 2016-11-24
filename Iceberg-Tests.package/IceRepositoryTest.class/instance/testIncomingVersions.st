tests - versions
testIncomingVersions
	| package | 
	package := repository packageNamed: packageName.

	"1. - Preparation: checkout the all-but-last version"
	package versions second load.

	"2. - Exercise"
	self assert: package incomingCommits size equals: 1
