private-changes
changedFilesBetween: aCommitish and: otherCommitish
	"Answer a list of files that changed between two commits"

	self handleLibgitError: [ | fromTree toTree diff |
		fromTree := (LGitCommit of: self repositoryHandle fromHexString: aCommitish id) tree.
		toTree := (LGitCommit of: self repositoryHandle fromHexString: otherCommitish id) tree.
		diff := fromTree diffTo: toTree.
		^ diff files ]