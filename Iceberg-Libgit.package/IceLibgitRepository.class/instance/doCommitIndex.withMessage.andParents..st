private-commit
doCommitIndex: anIceGitIndex withMessage: message andParents: parentCommitishList 
	
	| newCommit |
	anIceGitIndex addToGitIndex.
	newCommit := self commitIndexWithMessage: message andParents: parentCommitishList.
	newCommit repository: self.	
	^ newCommit