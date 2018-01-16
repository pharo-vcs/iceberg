API-actions
checkoutPackageNamed: aString 
	"Load the code of the given package into the working copy.
	Does not modify HEAD"
		
	self repository workingCopy
		checkoutPackageNamed: aString
		fromCommit: self