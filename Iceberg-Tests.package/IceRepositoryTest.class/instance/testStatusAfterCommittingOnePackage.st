tests - commit
testStatusAfterCommittingOnePackage
	"Load two packages"
	repository loadPackageNamed: packageName.
	repository loadPackageNamed: otherPackageName.
	
	"But save only one"
	self createLocalChanges.

	"Commit"	
	repository 
		commitChanges: repository workingCopyDiff
		withMessage: 'Commit one package in a repo with two loaded packages'.

	"There shouldn't be any incomming"
	self assert: repository incomingCommits isEmpty.
	self assert: repository outgoingCommits isNotEmpty.
	self assert: (IceRepositoryModel modelFor: repository) status equals: '1 not published'.
	