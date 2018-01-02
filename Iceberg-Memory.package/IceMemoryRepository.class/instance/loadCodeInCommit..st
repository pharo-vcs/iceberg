private-operations
loadCodeInCommit: aCommit 
	
	| newWorkingCopy |
	newWorkingCopy := self loadWorkingCopyFromCommit: aCommit.
	workingCopy := newWorkingCopy.