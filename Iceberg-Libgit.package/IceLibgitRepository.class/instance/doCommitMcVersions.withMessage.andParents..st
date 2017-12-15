private
doCommitMcVersions: versions withMessage: message andParents: parentCommitishList
	| packages newCommit |
	
	self addFilesToIndex: (versions
		collect: [ :version | self directoryForPackage: version package ]).
	newCommit := self commitIndexWithMessage: message andParents: parentCommitishList.
	newCommit repository: self.	
	^ newCommit