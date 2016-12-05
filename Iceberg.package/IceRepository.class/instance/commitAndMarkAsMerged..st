actions
commitAndMarkAsMerged: aCommitish
	| message changedPackages savedVersions newCommit |

	message := 'Merging with ', aCommitish id.
	changedPackages := self loadedPackages select: [ :package | package workingCopy needsSaving ].
	savedVersions := changedPackages collect: [ :package | 
		self internalSavePackage: package withMessage: message  ].
	
	newCommit := self backend 
		commitMcVersions: savedVersions 
		withMessage: message 
		andMarkAsMerged: aCommitish.

	self loadedCode commited: newCommit changingPackages: changedPackages 
