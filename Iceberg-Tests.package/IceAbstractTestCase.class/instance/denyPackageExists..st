assertions
denyPackageExists: aString 
	
	self deny: (self repository workingCopy environment ask includesPackageNamed: aString)