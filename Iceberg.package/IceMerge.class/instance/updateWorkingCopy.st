executing
updateWorkingCopy

	" 3 - Load changes in the image.
	In case the commit was already in the history, merge is a null object with no changes"
	repository workingCopy loadChangesInWorkingCopy: self changesToWorkingCopyTree.
	repository workingCopy refreshDirtyPackages