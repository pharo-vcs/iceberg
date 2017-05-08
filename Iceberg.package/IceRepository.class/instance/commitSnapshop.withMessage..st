actions - utility
commitSnapshop: aSnapshot withMessage: message
	^ self 
		commitSnapshot: aSnapshot
		withMessage: message
		andParents: { self headCommit }