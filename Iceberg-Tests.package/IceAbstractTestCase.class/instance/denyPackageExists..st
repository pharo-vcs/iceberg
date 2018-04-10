assertions
denyPackageExists: aString 
	
	self deny: (repository workingCopy environment ask includesPackageNamed: aString)