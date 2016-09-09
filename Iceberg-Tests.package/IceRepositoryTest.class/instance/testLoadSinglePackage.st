tests - loading
testLoadSinglePackage
	self deny: (RPackageOrganizer default includesPackageNamed: 'Pharo-Git-Test').
	
	repository loadPackage: 'Pharo-Git-Test'.
	
	self assert: (RPackageOrganizer default includesPackageNamed: 'Pharo-Git-Test').
	self assert: repository loadedCode commit equals: repository headCommit.