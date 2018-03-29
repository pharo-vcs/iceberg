tests - loading
testLoadSinglePackage
	self deny: (RPackageOrganizer default includesPackageNamed: packageName).
	
	repository loadPackageNamed: packageName.
	
	self assert: (RPackageOrganizer default includesPackageNamed: packageName).
	
	self assert: repository headCommit equals: (repository packageNamed: packageName) currentCommit