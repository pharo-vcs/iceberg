auxiliar
currentCommitId
	^ (self gitCommand: 'rev-list -1 HEAD') trim
