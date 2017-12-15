operations
commitPackages: modifiedPackages withMessage: aString 
	
	| newCommit |
	"Validate that the working copy is in the same state as the repository and we are in a branch.
	If we pass this validation, this means that the current HEAD is a parent for a next commit."
	self validateCanCommit.

	(modifiedPackages isEmpty and: [ self isInMerge not ])
		ifTrue: [ IceNothingToCommit signal ].
	
	"We commit the modified packages with a message and setting as parents the current reference commits.
	We could have more than one reference commit in case we are in a merge."
	newCommit := self repository
		commitPackages: modifiedPackages
		withMessage: aString
		parents: referenceCommits.
		
	self referenceCommit: newCommit.
	^ newCommit