private-operations
loadCodeInCommit: aCommit 
	
	| newWorkingCopy |
	newWorkingCopy := self loadWorkingCopyFromCommit: aCommit.
	loadedCode := newWorkingCopy.