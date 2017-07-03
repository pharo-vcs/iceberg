actions - utility
commitCherryPick: pickedCollection withMessage: message
	^ self 
		commitCherryPick: pickedCollection
		withMessage: message
		andParents: { self headCommit }