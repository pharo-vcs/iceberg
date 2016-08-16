private
directoryForPackage: package
	^ self fileUtils 
		directoryFromPath: package directoryName 
		relativeTo: directory.
			
