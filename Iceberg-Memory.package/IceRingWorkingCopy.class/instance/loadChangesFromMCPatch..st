private-monticello
loadChangesFromMCPatch: aMerge

	aMerge mergeTree
		accept: (IceRingWorkingCopyPatcherVisitor workingCopy: self).