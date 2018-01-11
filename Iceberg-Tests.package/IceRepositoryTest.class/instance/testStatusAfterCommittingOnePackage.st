tests - commit
testStatusAfterCommittingOnePackage
	"Load two packages"
	repository checkoutPackageNamed: packageName.
	repository checkoutPackageNamed: otherPackageName.
	
	"But save only one"
	self createLocalChanges.

	"Commit"	
	repository 
		commitPackages: repository workingCopyDiff changedPackages
		withMessage: 'Commit one package in a repo with two loaded packages'.

	"There shouldn't be any incomming"
	self assert: repository incomingCommits isEmpty.
	self assert: repository outgoingCommits isNotEmpty.
	self assert: (IceRepositoryModel modelFor: repository) status equals: '1 not published'.
	