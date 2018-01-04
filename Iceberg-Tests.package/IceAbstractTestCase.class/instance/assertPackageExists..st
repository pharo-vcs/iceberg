assertions
assertPackageExists: aString 
	
	self assert: (repository workingCopy environment ask includesPackageNamed: aString)