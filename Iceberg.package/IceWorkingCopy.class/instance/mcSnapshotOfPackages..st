private-monticello
mcSnapshotOfPackages: aCollection

	"Optimized version of #mcSnapshot.
	I create a big snapshot for only the collection of packages sent as argument."
	| allDefinitions |
	allDefinitions := (self mcPackageSnapshotsOfPackages: aCollection)
		inject: Set new
		into: [ :definitions :snapshot | | newDefinitions |
			newDefinitions := snapshot definitions.
			definitions addAll: newDefinitions.
			definitions ].
	
	^ MCSnapshot fromDefinitions: allDefinitions.