API-commits
commitChanges: aDiff withMessage: message 
	"Creates a commit with the given changes using the comment given as argument.
	
	NOTICE that commits can only be done if the following is true:

 - HEAD is a branch
 - the working copy reference commit is the same commit as #headCommit"
	
	| newCommit |
	self validateCanCommit.
	self repository index
		updateDiskWorkingCopy: aDiff;
		updateIndex: aDiff.

	repository index isEmpty ifTrue: [ IceNothingToCommit signal ].

	newCommit := self repository commitIndexWithMessage: message andParents: (self workingCopyState referenceCommits reject: [ :each | each isNoCommit ]).
	self referenceCommit: newCommit.
	self refreshDirtyPackages.
	^ newCommit