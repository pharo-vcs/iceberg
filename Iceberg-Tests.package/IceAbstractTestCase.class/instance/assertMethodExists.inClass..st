assertions
assertMethodExists: aMethodName inClass: aClassName 

	self assert: ((self repository workingCopy environment ask classNamed: aClassName) includesSelector: aMethodName)
		