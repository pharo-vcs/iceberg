accessing
directoryForPackage: mcPackage
	^ (self frontend packageNamed: mcPackage name) directoryPathString 
