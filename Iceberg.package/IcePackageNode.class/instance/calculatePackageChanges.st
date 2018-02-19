building
calculatePackageChanges
	| leftSnapshot rightSnapshot mcChanges |
	
	"If the package does not exist in any of the versions, we produce an empty snapshot to compare"
	leftSnapshot := [ self leftVersion snapshotFor: self package ]
		on: IceVersionDoesNotExist
		do: [ MCSnapshot empty ].
	
	rightSnapshot := [ self rightVersion snapshotFor: self package ]
		on: IceVersionDoesNotExist
		do: [ MCSnapshot empty ].

	"MCPatch calculates changes in the opposite...
	We should then calculate a patch from right snapshot to left snapshot"
	mcChanges := (MCPatch fromBase: rightSnapshot target: leftSnapshot) operations.
	mcChanges ifEmpty: [ 
		(self package isLoaded 
			and: [ self package isModified
				and: [ self leftVersion isKindOf: IceWorkingCopy ] ])
					ifTrue: [ self package mcWorkingCopy modified: false ] ].
	
	mcChanges do: [ :change | 
		change addToPackageDiff: self leftSnapshot: leftSnapshot rightSnapshot: rightSnapshot ].
	
	self hasCalculatedChanges