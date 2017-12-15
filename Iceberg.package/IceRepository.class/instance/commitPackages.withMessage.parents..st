actions - utility
commitPackages: packagesToCommit withMessage: message parents: parentCommits

	^ self 
		commitPackages: packagesToCommit
		withMessage: message
		andParents: (self head isUnbornBranch
			ifTrue: [ #() ]
			ifFalse: [ parentCommits ])