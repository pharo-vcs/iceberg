private-monticello
mcPackageSnapshotsOfPackages: aCollection 

	^ aCollection
		select: #isLoaded
		thenCollect: [ :package | package mcSnapshot ]