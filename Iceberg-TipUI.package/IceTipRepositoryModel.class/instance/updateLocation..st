actions
updateLocation: aReference
	
	"change location"
	self entity location: aReference.
	"force refresh packages"
	self entity workingCopy project: self entity project.
	
	Iceberg announcer announce: (IceRepositoryModified for: self entity)