asserting
denyMethodExists: aMethodName inClass: aClassName 
	self deny: ((self repository workingCopy environment ask classNamed: aClassName) includesSelector: aMethodName)
