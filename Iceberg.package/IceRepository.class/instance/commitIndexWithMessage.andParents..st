API-commit
commitIndexWithMessage: message andParents: parentCommitishList
	"Low level.
	
	Commit what is saved in the index"
	
	| newCommit |
	newCommit := index commitWithMessage: message andParents: parentCommitishList.
	index := self newIndex.
	self workingCopy referenceCommit: newCommit.
	self workingCopy refreshDirtyPackages.
	^ newCommit