commits
incommingCommits
	^ self upstream
		ifNotNil: [ self upstream commitsNotIn: self ]
		ifNil: [ #() ]