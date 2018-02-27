API-commits
commitChanges: aDiff withMessage: message 
	"Creates a commit with the given changes using the comment given as argument.
	
	NOTICE that commits can only be done if the following is true:

 - HEAD is a branch
 - the working copy reference commit is the same commit as #headCommit"
	
	| newCommit index |
	
	aDiff isEmpty ifTrue: [ IceNothingToCommit signal ].
	self validateCanCommit.
	
	index := self repository newIndex.
	aDiff tree accept: (IceIndexUpdateVisitor new
		index: index;
		diff: aDiff).

	newCommit := self repository
		doCommitIndex: index
		withMessage: message
		andParents: (self workingCopyState referenceCommits select: [ :each | each isNoCommit not ]).
	self adoptCommit: newCommit.

	self unmarkDirtyPackages.
	^ newCommit