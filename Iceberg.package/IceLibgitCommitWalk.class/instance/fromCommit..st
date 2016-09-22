walk definition
fromCommit: commit
	self revwalk pushCommit: (LGitId fromHexString: commit id)