tests - versions
testIncomingVersionsFromUpstream
	| package | 
	"1. - Preparation: checkout the all-but-last version"
	self gitCommand: 'reset --hard master^'.
	repository loadPackageNamed: packageName.
	repository fetch.

	"2. - Exercise"
	package := repository packageNamed: packageName.
	self assert: repository incomingCommits size equals: 1.
	"
	// Does not work, reported in https://github.com/npasserini/iceberg/issues/106
	self assert: package incomingVersions size equals: 1
	"