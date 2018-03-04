accessing-monticello
mcSnapshotInRepository
	"Answer a version of the package as it is present on repository. 
	 Useful to browse non-loaded packages."
	^ self repository branch snapshotFor: self