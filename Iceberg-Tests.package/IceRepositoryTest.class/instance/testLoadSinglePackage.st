tests
testLoadSinglePackage
	self deny: (RPackageOrganizer default includesPackageNamed: 'Pharo-Git-Test').
	git loadPackage: 'Pharo-Git-Test'.
	self assert: (RPackageOrganizer default includesPackageNamed: 'Pharo-Git-Test')