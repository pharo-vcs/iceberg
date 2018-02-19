building
buildPackageNodeFromPackage: anIcePackage parent: parent
	
	| packageNode leftSnapshot rightSnapshot mcChanges |
	packageNode := IcePackageNode
		package: anIcePackage
		parent: parent.
			
	"If the package does not exist in any of the versions, we produce an empty snapshot to compare"
	leftSnapshot := [ source snapshotFor: anIcePackage ]
		on: IceVersionDoesNotExist
		do: [ MCSnapshot empty ].
	
	rightSnapshot := [ target snapshotFor: anIcePackage ]
		on: IceVersionDoesNotExist
		do: [ MCSnapshot empty ].

	"MCPatch calculates changes in the opposite...
	We should then calculate a patch from right snapshot to left snapshot"
	mcChanges := (MCPatch fromBase: rightSnapshot target: leftSnapshot) operations.
	mcChanges ifEmpty: [ 
		(anIcePackage isLoaded 
			and: [ anIcePackage isModified
				and: [ source isKindOf: IceWorkingCopy ] ])
					ifTrue: [ anIcePackage mcWorkingCopy modified: false ] ].
	
	mcChanges do: [ :change | | node |
		node := change definition
			accept: (IceDiffNodeBuilder new
				diff: self;
				parentNode: packageNode;
				sourceSnapshot: leftSnapshot;
				targetSnapshot: rightSnapshot;
				operation: change;
				yourself).
	].
	^ packageNode