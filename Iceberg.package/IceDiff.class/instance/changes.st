querying
changes
	^ changes ifNil: [changes := 
		repository loadedPackages flatCollect: [ :package |
			(MCPatch 
				fromBase: (self theirSnapshot: package) 
				target: (self mySnapshot: package)) 
				operations
	 ]]
