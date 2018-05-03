accessing
shortCommitId
	^ [self entity headCommit shortId] on: Error do: [ nil ].