accessing
iceVersion: anObject
	iceVersion := anObject.
	self packageDirectory: (IceSavedPackage named: iceVersion package name repository: iceVersion commit repository) directoryPathString
