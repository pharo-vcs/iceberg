actions
commitAndMarkAsMerged: aCommitish
	| message changedPackages savedVersions |

	message := 'Merging with ', aCommitish id.
	changedPackages := self savedPackages select: [ :package | package workingCopy needsSaving ].
	savedVersions := changedPackages collect: [ :package | 
		self internalSavePackage: package withMessage: message  ].

	self backend 
		commit: savedVersions 
		withMessage: message 
		andMarkAsMerged: aCommitish
