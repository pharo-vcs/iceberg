private-monticello
mcPackageSnapshots
	
	^ self packageNames collect: [ :name |
		(self repository
			mcVersionForPackage: (MCPackage named: name)
			inCommit: self)
				snapshot ]