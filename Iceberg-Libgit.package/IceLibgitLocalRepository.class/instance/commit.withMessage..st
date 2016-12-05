actions
commit: versions withMessage: message
	^ self doCommit: versions withMessage: message andParents: [:repo | 
		[ { repo head object } ]
			on: LGit_GIT_EUNBORNBRANCH 
			do: [ "An 'unborn' branch means that it has no commits yet, so create a commit with no parents" #() ]
	]
