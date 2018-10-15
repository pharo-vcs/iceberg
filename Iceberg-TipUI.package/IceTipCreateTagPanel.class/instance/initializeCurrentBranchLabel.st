initialization
initializeCurrentBranchLabel
	currentCommitishLabel := self newLabel
		label: 'Current commit: ' , commitishToTag commit shortId