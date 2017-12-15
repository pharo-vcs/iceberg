private-monticello
mcSnapshot

	| allDefinitions |
	allDefinitions := self mcPackageSnapshots
		inject: Set new
		into: [ :definitions :snapshot | | newDefinitions |
			newDefinitions := snapshot definitions.
			definitions addAll: newDefinitions.
			definitions ].
	
	^ MCSnapshot fromDefinitions: allDefinitions.