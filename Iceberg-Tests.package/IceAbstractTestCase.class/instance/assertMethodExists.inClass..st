assertions
assertMethodExists: aMethodName inClass: aClassName 

	self assert: ((repository workingCopy environment ask classNamed: aClassName) includesSelector: aMethodName)
		