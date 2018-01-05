commits
outgoingCommitsTo: aRemote
	
	| remoteBranch walk |

	remoteBranch := aRemote remoteBranchNamed: self name ifAbsent: [ nil ].
	walk := self newCommitWalk.
	remoteBranch ifNotNil: [ 
		walk uptoCommit: remoteBranch commit ].
	^ walk commits