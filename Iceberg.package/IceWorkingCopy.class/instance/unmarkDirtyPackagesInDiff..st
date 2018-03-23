private-monticello
unmarkDirtyPackagesInDiff: aDiff
	
	self unmarkDirtyPackagesThat: [ :each |
		(aDiff includesPackageNamed: each name) not ]