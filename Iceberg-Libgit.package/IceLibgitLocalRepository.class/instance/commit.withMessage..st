actions
commit: versions withMessage: message
	^ self 
		doCommit: versions
		withMessage: message 
		andParents: [ :repo | 
			repo isUnborn 
				ifTrue: [ #() ]
				ifFalse: [ { repo head object } ] ]
