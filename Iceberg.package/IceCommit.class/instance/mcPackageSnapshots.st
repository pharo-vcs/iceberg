private-monticello
mcPackageSnapshots
	
	^ self packages
		select: #isLoaded
		thenCollect: [ :package |
			(self repository
				mcVersionForPackage: package mcPackage
				inCommit: self)
					snapshot ]