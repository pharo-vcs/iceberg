private-monticello
loadChangesFromMCPatch: aMerge
	
	aMerge mergeTree accept: IceWorkingCopyPatcherVisitor new.
