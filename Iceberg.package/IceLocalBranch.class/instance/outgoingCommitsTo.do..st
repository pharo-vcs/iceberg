commits
outgoingCommitsTo: aRemote do: aBlock
	| walk | 
	walk := self repository newCommitWalk fromBranch: self.
	walk uptoBranch: (self upstreamFor: aRemote).
	aBlock cull: walk.
	^ walk commits.