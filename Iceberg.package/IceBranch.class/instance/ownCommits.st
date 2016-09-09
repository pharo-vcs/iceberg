commits
ownCommits
	"Return the commits that are only in this branch."
	self ensureCommitsLoaded.
	^ self backend commitsOnlyIn: self name