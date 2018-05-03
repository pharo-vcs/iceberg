actions
updateLocation: aReference subdirectory: aString
	
	"change location"
	self entity 
		location: aReference;
		subdirectory: aString.
	"force refresh packages"
	self entity workingCopy refreshPackages.
	
	Iceberg announcer announce: (IceRepositoryModified for: self entity)