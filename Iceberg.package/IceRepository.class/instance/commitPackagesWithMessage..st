actions - utility
commitPackagesWithMessage: message
	self 
		commitPackages: (self loadedPackages select: [ :package | package workingCopy needsSaving ])
		withMessage: message.
