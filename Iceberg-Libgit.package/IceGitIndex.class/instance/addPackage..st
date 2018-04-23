adding
addPackage: anIcePackageDefinition 
	
	| pathSegments |
	pathSegments := OrderedCollection new.
	repository subdirectory
		ifNotEmpty: [ :directory | pathSegments add: directory ].
	pathSegments add: (repository writerClass directoryNameFor: anIcePackageDefinition).
	
	self addPath: (RelativePath withAll: pathSegments)