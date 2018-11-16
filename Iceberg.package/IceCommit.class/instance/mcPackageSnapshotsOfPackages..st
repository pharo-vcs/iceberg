private-monticello
mcPackageSnapshotsOfPackages: aCollection
	self flag: #todo. "I'm not sure I need to answer an empty snapshot. 
	if there is no mcVersion it likely means the package was removed and an empty snapshow will 
	keep it there."
	^ aCollection
		select: #isLoaded
		thenCollect: [ :package |
			[ (self repository mcVersionFor: 
				(IceSavedPackageVersion fromCommit: self package: package mcPackage))
					snapshot ]
			on: IceVersionDoesNotExist 
			do: [ :e | MCSnapshot empty ] ]