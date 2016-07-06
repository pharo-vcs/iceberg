tests
testCreateBranch
	"Verify before exercise"
	self assert: repository branch equals: 'master'.
	self assert: repository backend branch equals: 'master'.
	self assert: (self gitCommand: 'symbolic-ref --short HEAD') trim equals: 'master'.
	self assert: repository outgoingCommits isEmpty.

	"Exercise"
	repository loadPackage: packageName.
	repository createBranch: 'createdBranch'.

	"Assert"
	"1 - Basic asserts"
	self assert: repository branch equals: 'createdBranch'.
	self assert: repository backend branch equals: 'createdBranch'.
	self assert: (self gitCommand: 'symbolic-ref --short HEAD') trim equals: 'createdBranch'.
	
	"2 - Branch does not exist in upstream, cannnot compute outgoingCommits"
	self should: [ repository outgoingCommits ] raise: IceNoRemoteBranch.
	
	"3 - Commit and push"
	self saveNewVersion.
	repository push.
	self assert: repository outgoingCommits isEmpty.	

