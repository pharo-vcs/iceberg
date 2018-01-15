private-monticello
mcPackageSnapshotsOfPackages: aCollection
	
	^ aCollection
		select: #isLoaded
		thenCollect: [ :package |
			(self repository
				mcVersionForPackage: package mcPackage
				inCommit: self)
					snapshot ]