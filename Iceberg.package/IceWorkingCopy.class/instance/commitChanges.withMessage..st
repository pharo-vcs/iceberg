API-commits
commitChanges: aDiff withMessage: message 
	"Creates a commit with the given changes using the comment given as argument.
	
	NOTICE that commits can only be done if the following is true:

 - HEAD is a branch
 - the working copy reference commit is the same commit as #headCommit"
	
	| newCommit |
	
	aDiff isEmpty ifTrue: [ IceNothingToCommit signal ].
	self validateCanCommit.
	
	aDiff tree accept: (IceIndexUpdateVisitor new
		index: self repository index;
		diff: aDiff).

	newCommit := self repository commitIndexWithMessage: message andParents: (self workingCopyState referenceCommits reject: [ :each | each isNoCommit ]).
	self adoptCommit: newCommit.
	self refreshDirtyPackages.
	^ newCommit