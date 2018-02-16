API-commit
commitChanges: changes withMessage: message
	"Creates a commit with the given changes using the comment given as argument.
	
	NOTICE that commits can only be done if the following is true:

 - HEAD is a branch
 - the working copy reference commit is the same commit as #headCommit"

	^ self workingCopy
		commitChanges: changes
		withMessage: message