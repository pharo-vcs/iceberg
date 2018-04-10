private-monticello
mcSnapshot

	| allDefinitions |
	allDefinitions := mcCommit dependencies
		inject: Set new
		into: [ :definitions :version | | newDefinitions |
			newDefinitions := (self repository codeRepository versionWithInfo: version) snapshot definitions.
			definitions addAll: newDefinitions.
			definitions ].
	
	^ MCSnapshot fromDefinitions: allDefinitions.