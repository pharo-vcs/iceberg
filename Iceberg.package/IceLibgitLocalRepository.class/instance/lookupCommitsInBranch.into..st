querying
lookupCommitsInBranch: branchName into: aCommitRegistry
	"Load versions from the real repository, latest first"
	self commitsInBranch: branchName do: [ :commit |
		aCommitRegistry addCommit: (self class parseCommitInfo: commit)].


