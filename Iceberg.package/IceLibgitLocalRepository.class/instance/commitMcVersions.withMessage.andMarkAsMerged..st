actions
commitMcVersions: versions withMessage: message andMarkAsMerged: aCommitish
	^ self doCommitMcVersions: versions withMessage: message andParents: [:repo | { 
		repo head object.
		LGitCommit of: repo fromHexString: aCommitish id
	}]
