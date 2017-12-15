accessing
iceVersion: anObject
	iceVersion := anObject.
	self packageDirectory: (iceVersion commit repository directoryPathStringForPackage: iceVersion package)