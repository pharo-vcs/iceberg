private-changes
loadChangesInWorkingCopy: aTree
	
	aTree accept: (IceWorkingCopyPatcherVisitor on: self repository)