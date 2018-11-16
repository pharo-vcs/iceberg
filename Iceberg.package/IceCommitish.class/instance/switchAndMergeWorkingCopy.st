API-actions
switchAndMergeWorkingCopy
	self switch.
	self flag: #todo. "Demeters law"
	self repository workingCopy referenceCommit merge.
	self commit merge