actions
commit: versions withMessage: message andMarkAsMerged: aCommitish
	^ self doCommit: versions withMessage: message andParents: [:repo | { 
		repo head object.
		LGitCommit of: repo fromHexString: aCommitish id
	}]
