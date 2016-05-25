querying
changes
	^ changes ifNil: [changes := 
		repository allPackages flatCollect: [ :package |
			| mine theirs patch |
			mine := package workingCopy snapshot.
			theirs := (repository latestVersionForPackage: package) snapshot.
			patch := MCPatch fromBase: theirs target: mine.
			patch operations
	 ]]
