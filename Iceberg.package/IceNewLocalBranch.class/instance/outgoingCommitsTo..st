commits
outgoingCommitsTo: aRemote
	
	| remoteBranch walk |
	aRemote fetchBranch: self.
	remoteBranch := aRemote remoteBranchNamed: self name ifAbsent: [ nil ].
	walk := self newCommitWalk.
	remoteBranch ifNotNil: [ 
		walk uptoCommit: remoteBranch commit ].
	^ walk commits