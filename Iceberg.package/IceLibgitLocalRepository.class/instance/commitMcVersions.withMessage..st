actions
commitMcVersions: versions withMessage: message
	^ self doCommitMcVersions: versions withMessage: message andParents: [:repo | { repo head object }]