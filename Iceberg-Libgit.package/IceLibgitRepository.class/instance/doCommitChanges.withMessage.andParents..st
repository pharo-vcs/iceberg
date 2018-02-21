private-commits
doCommitChanges: anIceDiff withMessage: message andParents: parentCommitishList
	
	| newCommit |
	1halt.
	self addFilesToIndex: (anIceDiff modifiedFiles collect: [ :e | e pathString ]).
	1halt.
	newCommit := self commitIndexWithMessage: message andParents: parentCommitishList.
	newCommit repository: self.	
	^ newCommit