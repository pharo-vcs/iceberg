adding
addPackage: anIcePackageDefinition 
	
	| pathSegments |
	pathSegments := repository subdirectoryPath segments asOrderedCollection.
	pathSegments add: (repository writerClass directoryNameFor: anIcePackageDefinition).	
	self addPath: (RelativePath withAll: pathSegments)