accessing
iceVersion: anObject
	iceVersion := anObject.
	self packageDirectory: (iceVersion commit project sourceDirectoryPath / (IcePackage named: iceVersion package name repository: iceVersion commit repository) directoryName) pathString