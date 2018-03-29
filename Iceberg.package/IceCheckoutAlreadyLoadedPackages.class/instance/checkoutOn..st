checkout
checkoutOn: anIceWorkingCopy 
	
	diff accept: (IceWorkingCopyPatcherVisitor on: anIceWorkingCopy repository).
	anIceWorkingCopy referenceCommit: committish commit.
	anIceWorkingCopy markAllPackagesAsClean.