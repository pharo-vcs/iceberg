actions - utility
commitSnapshot: aSnapshot withMessage: message
	^ self 
		commitSnapshot: aSnapshot
		withMessage: message
		andParents: { self headCommit }