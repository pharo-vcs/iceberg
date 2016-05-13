querying
changes
	^ changes ifNil: [changes := 
		repository allPackages flatCollect: [ :package |
			| workingCopy mine theirs patch |
			workingCopy := Ice workingCopyForPackage: package.
			mine := workingCopy snapshot.
			theirs := (repository latestVersionForPackage: package) snapshot.
			patch := MCPatch fromBase: theirs target: mine.
			patch operations
	 ]]
