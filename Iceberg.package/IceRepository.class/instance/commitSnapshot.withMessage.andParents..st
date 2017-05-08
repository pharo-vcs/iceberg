private
commitSnapshot: aSnapshot withMessage: message andParents: parentCommitishList
	"Commits a snapshot of definitions (can be a cherry-pick). 
	 I need to group definitions in packages and create new versions for those packages, 
	 which is annoying but is the price of using MC definitions :)"
	| definitionsByPackage versions |
	
	"Split snapshot in packages"
	definitionsByPackage  := Dictionary new.
	aSnapshot definitions do: [ :each | 
		(definitionsByPackage 
			at: (RPackageOrganizer default packageNamed: each packageName)	
			ifAbsentPut: [ Set new ])
			add: each ].
	"collect versions"
	versions := OrderedCollection new.
	definitionsByPackage keysAndValuesDo: [ :package :defs |
		versions add: (MCVersion new
			setPackage: package
			info: (IceMCVersionInfo package: package message: message)
			snapshot: (MCSnapshot fromDefinitions: defs)
			dependencies: #()). "Note we do not track Monticello dependencies."  ].
	"save versions"
	versions do: [ :each | self backend internalStoreVersion: each ].
	"now perform commit"
	self doCommitMcVersions: versions withMessage: message andParents: parentCommitishList