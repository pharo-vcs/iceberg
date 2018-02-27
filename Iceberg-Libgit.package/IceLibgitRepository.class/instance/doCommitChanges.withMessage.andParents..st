private-commit
doCommitChanges: anIceDiff withMessage: message andParents: parentCommitishList
	
	| newCommit |
	self addFilesToIndex: (anIceDiff modifiedFiles collect: [ :e | e pathString ]).
	newCommit := self commitIndexWithMessage: message andParents: parentCommitishList.
	newCommit repository: self.	
	^ newCommit