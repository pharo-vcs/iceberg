accessing
sourceDirectoryReference
	
	^ commitish fileSystem resolve: (RelativePath with: self sourceDirectory)