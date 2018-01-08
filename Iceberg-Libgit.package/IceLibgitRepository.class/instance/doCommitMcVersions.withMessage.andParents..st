private
doCommitMcVersions: versions withMessage: message andParents: parentCommitishList
	| newCommit |

	self addFilesToIndex: (versions
		collect: [ :version | self directoryForPackage: version package ]).
	newCommit := self commitIndexWithMessage: message andParents: parentCommitishList.
	newCommit repository: self.	
	^ newCommit