tests - loading
testLoadSinglePackage
	| package |
	self deny: (RPackageOrganizer default includesPackageNamed: packageName).
	
	repository loadPackage: packageName.
	
	self assert: (RPackageOrganizer default includesPackageNamed: packageName).
	
	package := repository packageNamed: packageName.
	self assert: repository headCommit equals: (repository loadedCode loadedVersions at: package) commit
