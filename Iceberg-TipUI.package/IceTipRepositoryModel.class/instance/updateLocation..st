actions
updateLocation: aReference
	
	"change location"
	self entity location: aReference.
	self entity postFetch.

	Iceberg announcer announce: (IceRepositoryModified for: self entity)