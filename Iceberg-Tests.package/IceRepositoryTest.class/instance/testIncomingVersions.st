tests - versions
testIncomingVersions
	"1. - Preparation: checkout the all-but-last version"
	repository head commit parent checkout.
	repository switchToBranchNamed: 'master'.

	"2. - Exercise"
	self assert: repository incomingCommits size equals: 1
