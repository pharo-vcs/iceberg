actions
commitAndMarkAsMerged: aCommitish
	| message changedPackages savedVersions |

	message := 'Merging with ', aCommitish id.
	changedPackages := self loadedPackages select: [ :package | package workingCopy needsSaving ].
	savedVersions := changedPackages collect: [ :package | 
		self internalSavePackage: package withMessage: message  ].
	
	self backend 
		commit: savedVersions 
		withMessage: message 
		andMarkAsMerged: aCommitish.

	self refresh.
	changedPackages do: [ :package |
		package workingCopy versionInfo: package versions first info ]