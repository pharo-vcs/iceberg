commits
outgoingCommits
	^ self upstream 
		ifNotNil: [ :upstreamBranch | self branch commitsNotIn: upstreamBranch ]
		ifNil: [ self branch ownCommits ]
