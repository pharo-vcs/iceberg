assertions
denyClassExists: aString 
	
	self deny: (self repository workingCopy environment ask includesClassNamed: aString)