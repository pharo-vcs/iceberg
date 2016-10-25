commits
ownCommits
	"Return the commits that are only in this branch."
	^ self repository newCommitWalk
		fromBranch: self;
		uptoBranches: self repository localBranches;
		commits.
