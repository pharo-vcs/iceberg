API-packages
packageStatusForPackage: anIceSavedPackage 
	
	(anIceSavedPackage currentCommit repository = repository)
		ifTrue: [ ^ IceDetachedPackage package: anIceSavedPackage ].
	
	^ IceForeignPackage package: anIceSavedPackage