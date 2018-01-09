tests
testWorkingCopyHasNoSingleCommit
 	
	repository workingCopy reset.
	self deny: repository workingCopy hasSingleCommit