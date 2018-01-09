accessing
commitsNotLoaded
	
	| walk |
	walk := self repository head newCommitWalk.
	self limitCommitWalk: walk.
	^ walk commits