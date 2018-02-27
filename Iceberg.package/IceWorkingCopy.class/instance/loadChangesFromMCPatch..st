private-monticello
loadChangesFromMCPatch: aMerge
	
	aMerge mergeTree accept: (IceWorkingCopyPatcherVisitor on: self repository)