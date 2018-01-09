private-monticello
mcPackageNeedsSaving: iceSavedPackage

	iceSavedPackage isLoaded ifFalse: [ ^ false ].
	^ iceSavedPackage mcPackage workingCopy needsSaving