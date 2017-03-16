subdirectories
addSubdirectory: aSubdirectory

	self subdirectories addIfNotPresent: aSubdirectory.
	^ aSubdirectory