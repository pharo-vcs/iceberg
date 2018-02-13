private-monticello
mcPackageSnapshotsOfPackages: aCollection 

	^ aCollection
		select: #isLoaded
		thenCollect: [ :package | self snapshotForPackage: package ]