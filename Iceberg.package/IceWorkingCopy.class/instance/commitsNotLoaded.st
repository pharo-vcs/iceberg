querying
commitsNotLoaded

	| walk |
	self assert: self referenceCommit size = 1.

	walk := self repository head newCommitWalk.
	self referenceCommit first isNoCommit
		ifFalse: [ walk uptoCommit: self referenceCommit first ].

	^ walk commits