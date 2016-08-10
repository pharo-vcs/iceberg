commits
incommingCommits
	^ self commitsNotLoaded, (self upstream
		ifNotNil: [ self upstream commitsNotIn: self branch]
		ifNil: [ #() ])