private
commitCherryPick: pickedCollection withMessage: message andParents: parentCommitishList
	"Commits a snapshot of definitions (can be a cherry-pick). 
	 I need to group definitions in packages and create new versions for those packages, 
	 which is annoying but is the price of using MC definitions :)"
	| changesByPackage versions |
	
	versions := OrderedCollection new.
	changesByPackage := SmallDictionary new.
	pickedCollection do: [ :each | 
		(changesByPackage 
			at: each packageName 
			ifAbsentPut: [ Set new ])
			add: each ].
	
	changesByPackage keysAndValuesDo: [ :packageName :changes | | workingCopy patcher |
		workingCopy := (RPackageOrganizer default packageNamed: packageName) mcWorkingCopy.
		patcher := MCPatcher snapshot: (self packageNamed: packageName) loadedVersion snapshot.
		pickedCollection 
			select: [ :each | each isKindOf: IceMethodChange ] 
			thenDo: [ :each | each operation applyTo: patcher ].
		versions add: (MCVersion new
			setPackage: workingCopy package
			info: (IceMCVersionInfo package: workingCopy package message: message)
			snapshot: patcher patchedSnapshot
			dependencies: #()) ].	
	
	"save versions"
	versions do: [ :each | self backend internalStoreVersion: each ].
	"now perform commit"
	self doCommitMcVersions: versions withMessage: message andParents: parentCommitishList