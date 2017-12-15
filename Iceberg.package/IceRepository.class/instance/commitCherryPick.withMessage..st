actions - utility
commitCherryPick: pickedCollection withMessage: message

	self halt.
	^ self 
		commitCherryPick: pickedCollection
		withMessage: message
		andParents: { self headCommit }