API-commits
commitChanges: aDiff withMessage: message 
	"Creates a commit with the given changes using the comment given as argument.
	
	NOTICE that commits can only be done if the following is true:

 - HEAD is a branch
 - the working copy reference commit is the same commit as #headCommit"
	
	| newCommit |
	self validateCanCommit.
	
	1halt.
	aDiff storeInRepository: self repository.

	newCommit := self repository
		doCommitChanges: aDiff
		withMessage: message
		andParents: self workingCopyState referenceCommits.
	
	self referenceCommit: newCommit.
	^ newCommit