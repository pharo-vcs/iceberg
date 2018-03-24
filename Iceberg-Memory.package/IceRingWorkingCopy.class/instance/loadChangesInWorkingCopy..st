private-monticello
loadChangesInWorkingCopy: aMerge

	aMerge mergeTree
		accept: (IceRingWorkingCopyPatcherVisitor workingCopy: self).