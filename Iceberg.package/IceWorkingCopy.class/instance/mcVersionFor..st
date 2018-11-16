private-monticello
mcVersionFor: anIceSavedPackageVersion 

	| mcPackage mcWorkingCopy |
	mcPackage := anIceSavedPackageVersion mcPackage.
	mcWorkingCopy := mcPackage workingCopy.
	^ MCVersion new
		setPackage: anIceSavedPackageVersion mcPackage
		info: mcWorkingCopy versionInfo
		snapshot: mcWorkingCopy snapshot
		dependencies: #()