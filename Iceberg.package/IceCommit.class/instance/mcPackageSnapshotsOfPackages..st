private-monticello
mcPackageSnapshotsOfPackages: aCollection
	
	^ aCollection
		select: #isLoaded
		thenCollect: [ :package |
			(self repository mcVersionFor: 
				(IceSavedPackageVersion fromCommit: self package: package mcPackage))
					snapshot ]