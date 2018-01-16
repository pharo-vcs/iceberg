API-commits
commitChanges: changesToCommit withMessage: message 
	"Creates a commit with the given changes using the comment given as argument.
	
	NOTICE that commits can only be done if the following is true:

 - HEAD is a branch
 - the working copy reference commit is the same commit as #headCommit"
	
	| changesByPackage versions newCommit |
	self flag: #refactor.
	"This is really similar to a non-cherry-pick change.
	See #commitPackages:withMessage:"
	self validateCanCommit.
	
	versions := OrderedCollection new.
	changesByPackage := SmallDictionary new.

	"Collect changes by package"
	changesByPackage := changesToCommit groupedBy: [ :each | each packageName ].
	"Create patched versions for each package"
	changesByPackage keysAndValuesDo: [ :packageName :changes | 
		versions add: (self 
			patchVersionOf: packageName 
			changes: changes 
			message: message) ].	

	"save versions"
	versions do: [ :each | self repository internalStoreVersion: each ].

	"now perform commit"
	newCommit := self repository
		doCommitMcVersions: versions
		withMessage: message
		andParents: self workingCopyState referenceCommits.
	self referenceCommit: newCommit.
	^ newCommit