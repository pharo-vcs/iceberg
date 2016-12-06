actions - utility
commitPackages: packagesToCommit withMessage: message
	| savedVersions newCommit |
	packagesToCommit isEmpty ifTrue: [ NothingToCommitException signal ].
	
	savedVersions := packagesToCommit collect: [ :package | 
		self internalSavePackage: package withMessage: message  ].
	
	newCommit := self
		doCommitMcVersions: savedVersions 
		withMessage: message 
		andParents: { self headCommit }.
		
	self loadedCode commited: newCommit changingPackages: packagesToCommit.