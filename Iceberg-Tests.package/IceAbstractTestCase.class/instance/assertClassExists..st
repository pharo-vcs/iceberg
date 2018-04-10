assertions
assertClassExists: aString 
	
	self assert: (repository workingCopy environment ask includesClassNamed: aString)