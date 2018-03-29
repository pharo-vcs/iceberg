API-packages
markAsCleanPackagesNotInDiff: aDiff
	
	self markAsCleanPackagesThat: [ :each |
		(aDiff includesPackageNamed: each name) not ]