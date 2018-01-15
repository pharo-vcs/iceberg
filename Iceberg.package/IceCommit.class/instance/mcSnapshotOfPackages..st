private-monticello
mcSnapshotOfPackages: aCollection

	| allDefinitions |
	allDefinitions := (self mcPackageSnapshotsOfPackages: aCollection)
		inject: Set new
		into: [ :definitions :snapshot | | newDefinitions |
			newDefinitions := snapshot definitions.
			definitions addAll: newDefinitions.
			definitions ].
	
	^ MCSnapshot fromDefinitions: allDefinitions.