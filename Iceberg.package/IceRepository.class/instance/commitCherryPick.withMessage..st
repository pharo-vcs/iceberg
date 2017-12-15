actions - utility
commitCherryPick: changes withMessage: message

	^ self workingCopy
		commitChanges: changes
		withMessage: message