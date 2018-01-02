changs
changedPackagesToWorkingCopy: anIceWorkingCopy 
	
	"A branch is just a name to a commit.
	Delegate change computation to the commit."
	
	^ self commit changedPackagesToWorkingCopy: anIceWorkingCopy 