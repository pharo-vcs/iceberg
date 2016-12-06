actions - utility
commitPackagesAndMarkAsMerged: aCommitish
	| message changedPackages savedVersions newCommit |

	message := 'Merging with ', aCommitish id.
	changedPackages := self loadedPackages select: [ :package | package workingCopy needsSaving ].
	savedVersions := changedPackages collect: [ :package | 
		self internalSavePackage: package withMessage: message  ].
	
	newCommit := self
		doCommitMcVersions: savedVersions 
		withMessage: message 
		andParents: { self headCommit . aCommitish }.

	self loadedCode commited: newCommit changingPackages: changedPackages 
