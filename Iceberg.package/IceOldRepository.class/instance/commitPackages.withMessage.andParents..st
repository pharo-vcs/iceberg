private
commitPackages: packagesToCommit withMessage: message andParents: parentCommitishList
	| savedVersions |
	
	self validateCanCommit.

	savedVersions := packagesToCommit collect: [ :package | 
		self 
			internalSavePackage: package 
			withMessage: message ].	
	self
		doCommitMcVersions: savedVersions 
		withMessage: message 
		andParents: parentCommitishList