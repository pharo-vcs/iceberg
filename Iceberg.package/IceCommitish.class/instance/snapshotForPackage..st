accessing-monticello
snapshotForPackage: anIceSavedPackage

	self halt.
	^ (self mcVersionFor: (self versionFor: anIceSavedPackage)) snapshot