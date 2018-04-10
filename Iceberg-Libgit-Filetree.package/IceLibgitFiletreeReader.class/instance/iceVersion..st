accessing
iceVersion: anObject
	iceVersion := anObject.
	self packageDirectory: (IcePackage named: iceVersion package name repository: iceVersion commit repository) directoryPathString
