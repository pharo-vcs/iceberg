assertions
assertPackageExists: aString 
	
	self assert: (self repository workingCopy environment ask includesPackageNamed: aString)