walk definition
fromCommit: commit
	self fromLGitId: (LGitId fromHexString: commit id)