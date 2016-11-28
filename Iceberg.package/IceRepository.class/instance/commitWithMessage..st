actions
commitWithMessage: message
	self 
		commit: (self loadedPackages select: [ :package | package workingCopy needsSaving ])
		withMessage: message.
