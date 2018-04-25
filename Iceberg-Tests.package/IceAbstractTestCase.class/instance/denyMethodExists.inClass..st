asserting
denyMethodExists: aMethodName inClass: aClassName 
	self deny: ((repository workingCopy environment ask classNamed: aClassName) includesSelector: aMethodName)
