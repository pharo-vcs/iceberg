accessing
changedPackagesToWorkingCopy: aWorkingCopy
	^ self loadedVersions keys select: #isModified