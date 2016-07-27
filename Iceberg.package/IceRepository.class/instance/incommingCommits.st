commits
incommingCommits
	^ self commitsNotLoaded, (self upstream commitsNotIn: self branch)