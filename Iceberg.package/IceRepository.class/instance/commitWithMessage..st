actions
commitWithMessage: message
	self 
		commitPackages: (self loadedPackages select: [ :package | package workingCopy needsSaving ])
		withMessage: message.
