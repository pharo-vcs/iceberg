actions
commitPackages: packagesToCommit withMessage: message
	| savedVersions newCommit |
	packagesToCommit isEmpty ifTrue: [ NothingToCommitException signal ].
	
	savedVersions := packagesToCommit collect: [ :package | 
		self internalSavePackage: package withMessage: message  ].
	
	newCommit := self backend 
		commitMcVersions: savedVersions 
		withMessage: message.
		
	self loadedCode commited: newCommit changingPackages: packagesToCommit.
