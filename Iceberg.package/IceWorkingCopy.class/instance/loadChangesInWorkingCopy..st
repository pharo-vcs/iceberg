private-changes
loadChangesInWorkingCopy: aMerge
	
	aMerge mergeTree accept: (IceWorkingCopyPatcherVisitor on: self repository)