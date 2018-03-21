accessing
onSuccessRepositoryModified: aRepository
	^ self onSuccessAnnounce: [ IceRepositoryModified for: aRepository ]