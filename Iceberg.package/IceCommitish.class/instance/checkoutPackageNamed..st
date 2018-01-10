checkout
checkoutPackageNamed: aString 
	
	self repository workingCopy
		checkoutPackageNamed: aString
		fromCommit: self