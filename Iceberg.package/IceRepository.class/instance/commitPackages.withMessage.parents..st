private-commit
commitPackages: packagesToCommit withMessage: message parents: parentCommitishList
	| savedVersions parentCommits |
	
	savedVersions := packagesToCommit collect: [ :package | 
		self 
			internalSavePackage: package 
			withMessage: message ].	
			
	parentCommits := self head isUnbornBranch
			ifTrue: [ #() ]
			ifFalse: [ parentCommitishList ].
	^ self
		doCommitMcVersions: savedVersions 
		withMessage: message 
		andParents: parentCommits