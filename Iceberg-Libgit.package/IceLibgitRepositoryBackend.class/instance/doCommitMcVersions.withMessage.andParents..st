actions
doCommitMcVersions: versions withMessage: message andParents: parentCommitishList
	| packages newCommit |
	
	self addFilesToIndex: (versions
		collect: [ :version | self directoryForPackage: version package ]).
	newCommit := self commitIndexWithMessage: message andParents: parentCommitishList.
	newCommit repository: self frontend.
	
	packages := parentCommitishList 
		inject: Set new 
		into: [ :all :each | all addAll: (each diffTo: newCommit) changedPackages; yourself ].
	
	self frontend loadedCode 
		commited: newCommit changingPackages: packages.
	
	^ newCommit