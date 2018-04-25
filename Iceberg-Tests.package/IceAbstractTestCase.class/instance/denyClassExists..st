assertions
denyClassExists: aString 
	
	self deny: (repository workingCopy environment ask includesClassNamed: aString)