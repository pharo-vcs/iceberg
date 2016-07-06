auxiliar
currentCommitMessage
	^ (self gitCommand: 'rev-list -1 --pretty=format:%s HEAD') lines second
