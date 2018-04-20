API-remotes
outgoingCommitsTo: aRemote
	
	| remoteBranch walk |

	"If there is no remote tracking branch in the remote, we cannot calculate outgoing commits.
	All the commits in the branch are going to be outgoing, so I will take the first 20 to show."
	remoteBranch := aRemote remoteBranchNamed: self name ifAbsent: [ ^ self reducedOutgoingCommitsWhenNoRemote ].
	walk := self newCommitWalk.
	remoteBranch ifNotNil: [ 
		walk uptoCommit: remoteBranch commit ].
	^ walk commits