private-monticello
snapshotForPackage: anIceSavedPackage

	^ [ (self mcVersionFor: (self versionFor: anIceSavedPackage)) snapshot ]
		on: IceVersionDoesNotExist 
		do: [ MCSnapshot empty ]