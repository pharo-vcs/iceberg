accessing
projectFileReference
	
	^ (repository workingCopy fileSystem resolve resolve: self sourceDirectory) / '.project'.