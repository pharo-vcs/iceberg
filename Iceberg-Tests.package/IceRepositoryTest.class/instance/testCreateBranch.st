tests
testCreateBranch
	"Verify before exercise"
	self assert: repository branch name equals: 'master'.
	self assert: (self gitCommand: 'symbolic-ref --short HEAD') trim equals: 'master'.
	self assert: repository outgoingCommits isEmpty.

	"Exercise"
	repository loadPackageNamed: packageName.
	repository createBranch: 'createdBranch'.

	"Assert"
	"1 - Basic asserts"
	self assert: repository branch name equals: 'createdBranch'.
	self assert: (self gitCommand: 'symbolic-ref --short HEAD') trim equals: 'createdBranch'.
	
	"2 - Branch does not exist in upstream, cannnot compute outgoingCommits.
	This could be improved, see https://github.com/npasserini/iceberg/issues/85 "
	self assert: repository branch upstream isNil.
	self assert: repository outgoingCommits isEmpty.
	
	"3 - Commit and push"
	self saveNewVersion.
	self assert: repository outgoingCommits size equals: 0.
	[ 
		repository push.
		self assert: repository branch upstream name equals: 'origin/createdBranch'.
		self assert: repository outgoingCommits isEmpty.	
	]
	ensure: [ 
		"4 - Cleanup: Remove remote branch. "
		self gitCommand: 'push origin --delete createdBranch' 
	]

