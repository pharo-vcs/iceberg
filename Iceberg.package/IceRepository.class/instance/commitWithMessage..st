actions
commitWithMessage: message
	| changedPackages savedVersions |

	changedPackages := self loadedPackages select: [ :package | package workingCopy needsSaving ].
	savedVersions := changedPackages collect: [ :package | 
		self internalSavePackage: package withMessage: message  ].
	
	self backend 
		commit: savedVersions 
		withMessage: message.

	changedPackages do: [ :package |
		package workingCopy versionInfo: package versions first info ]