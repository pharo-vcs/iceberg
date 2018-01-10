commits
outgoingCommitsTo: aRemote
	
	| remoteBranch walk |

	"If there is no remote tracking branch in the remote, we cannot calculate outgoing commits"
	remoteBranch := aRemote remoteBranchNamed: self name ifAbsent: [ ^ #() ].
	walk := self newCommitWalk.
	remoteBranch ifNotNil: [ 
		walk uptoCommit: remoteBranch commit ].
	^ walk commits