operations
commitPackages: modifiedPackages withMessage: message 
	
	| newCommit |
	"Validate that the working copy is in the same state as the repository and we are in a branch.
	If we pass this validation, this means that the current HEAD is a parent for a next commit."
	self halt.
	self validateCanCommit.
	self flag: #refactor.
	"This is really similar to a cherry-pick change.
	See #commitChanges:withMessage:"
	
	(modifiedPackages isEmpty and: [ self isInMerge not ])
		ifTrue: [ IceNothingToCommit signal ].

	"We commit the modified packages with a message and setting as parents the current reference commits.
	We could have more than one reference commit in case we are in a merge."
	newCommit := self repository
		commitPackages: modifiedPackages
		withMessage: message
		parents: referenceCommits.
		
	self referenceCommit: newCommit.
	^ newCommit