assertions
assertClassExists: aString 
	
	self assert: (self repository workingCopy environment ask includesClassNamed: aString)