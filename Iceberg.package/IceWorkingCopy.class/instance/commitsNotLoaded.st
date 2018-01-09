querying
commitsNotLoaded

	| walk |
	walk := self repository head newCommitWalk.
	self referenceCommit limitCommitWalk: walk.
	^ walk commits