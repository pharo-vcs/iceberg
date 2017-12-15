actions - utility
commitPackages: packagesToCommit withMessage: message

	^ self workingCopy
		commitPackages: packagesToCommit
		withMessage: message