actions - utility
commitPackages: packagesToCommit withMessage: message
	^ self 
		commitPackages: packagesToCommit
		withMessage: message
		andParents: (self head isUnbornBranch
			ifTrue: [ #() ]
			ifFalse: [ { self head commit } ] )