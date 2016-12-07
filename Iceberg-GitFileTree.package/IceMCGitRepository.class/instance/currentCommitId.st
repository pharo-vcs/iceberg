querying
currentCommitId
	^ (self command: 'rev-parse HEAD') trim