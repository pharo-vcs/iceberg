private-commit
commitPackages: packagesToCommit withMessage: message

	^ self workingCopy
		commitPackages: packagesToCommit
		withMessage: message