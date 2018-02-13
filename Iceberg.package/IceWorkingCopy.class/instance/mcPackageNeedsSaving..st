private-monticello
mcPackageNeedsSaving: iceSavedPackage
	iceSavedPackage isLoaded ifFalse: [ ^ false ].
	^ iceSavedPackage mcWorkingCopy needsSaving