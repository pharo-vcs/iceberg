commits
outgoingCommits
	^ self upstream 
		ifNil: [self commits ]
		ifNotNil: [ :upstreamBranch | self branch commitsNotIn: upstreamBranch ]
