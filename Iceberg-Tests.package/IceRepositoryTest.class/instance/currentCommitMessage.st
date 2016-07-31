auxiliar
currentCommitMessage
	^ (self gitCommand: 'rev-list -1 --pretty=%s HEAD') lines second
