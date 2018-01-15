operations
commitChanges: changesToCommit withMessage: message 
	
	"Commits a snapshot of definitions (can be a cherry-pick). 
	 I need to group definitions in packages and create new versions for those packages, 
	 which is annoying but is the price of using MC definitions :)"
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

		self halt.
	"now perform commit"
	newCommit := self repository
		doCommitMcVersions: versions withMessage: message andParents: referenceCommits.

	self referenceCommit: newCommit.
	^ newCommit