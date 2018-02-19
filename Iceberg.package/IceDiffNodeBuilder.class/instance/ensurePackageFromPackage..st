building
ensurePackageFromPackage: anIcePackage 
	
	| packageNode leftSnapshot rightSnapshot mcChanges |
	
	parentNode
		childAt: (diff directoryNameFor: anIcePackage)
		ifPresent: [ :found | ^ found ].
	
	packageNode := IcePackageNode
		package: anIcePackage
		parent: parentNode.
			
	"If the package does not exist in any of the versions, we produce an empty snapshot to compare"
	leftSnapshot := [ diff sourceVersion snapshotFor: anIcePackage ]
		on: IceVersionDoesNotExist
		do: [ MCSnapshot empty ].
	
	rightSnapshot := [ diff targetVersion snapshotFor: anIcePackage ]
		on: IceVersionDoesNotExist
		do: [ MCSnapshot empty ].

	"MCPatch calculates changes in the opposite...
	We should then calculate a patch from right snapshot to left snapshot"
	mcChanges := (MCPatch fromBase: rightSnapshot target: leftSnapshot) operations.
	mcChanges ifEmpty: [ 
		(anIcePackage isLoaded 
			and: [ anIcePackage isModified
				and: [ diff sourceVersion isKindOf: IceWorkingCopy ] ])
					ifTrue: [ anIcePackage mcWorkingCopy modified: false ] ].
	
	mcChanges do: [ :change | | node |
		node := change definition
			accept: (IceDiffNodeBuilder new
				diff: diff;
				parentNode: packageNode;
				sourceSnapshot: leftSnapshot;
				targetSnapshot: rightSnapshot;
				operation: change;
				yourself).
	].

	parentNode
		childAt: (diff directoryNameFor: anIcePackage)
		put: packageNode.
	^ packageNode