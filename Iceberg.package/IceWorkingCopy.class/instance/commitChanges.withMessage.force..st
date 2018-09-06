as yet unclassified
commitChanges: aDiff withMessage: message force: forcing 

	"Creates a commit with the given changes using the comment given as argument.
	The forcing parameter allows to create an empty commit. This is used by the merge.
	
	NOTICE that commits can only be done if the following is true:

 - HEAD is a branch
 - the working copy reference commit is the same commit as #headCommit"

	| newCommit |
	self validateCanCommit.
	self repository index
		updateDiskWorkingCopy: aDiff;
		updateIndex: aDiff.

	(forcing not and: [repository index isEmpty]) 
		ifTrue: [ IceNothingToCommit signal ].

	newCommit := self repository
		commitIndexWithMessage: message
		andParents: (self workingCopyState referenceCommits reject: [ :each | each isNoCommit ]).
	^ newCommit