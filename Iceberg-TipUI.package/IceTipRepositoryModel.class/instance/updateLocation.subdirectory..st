actions
updateLocation: aReference subdirectory: aString
	
	"change location"
	self entity 
		location: aReference;
		subdirectory: aString.
	"force refresh packages"
	self entity workingCopy referenceCommit: self entity workingCopy referenceCommit.
	
	Iceberg announcer announce: (IceRepositoryModified for: self entity)