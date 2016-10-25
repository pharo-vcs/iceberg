commits
outgoingCommits
	^ self upstream 
		ifNotNil: [ self commitsNotIn: self upstream ]
		ifNil: [ self ownCommits ]
