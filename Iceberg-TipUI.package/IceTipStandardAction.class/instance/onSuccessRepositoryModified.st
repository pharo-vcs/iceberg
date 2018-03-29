accessing
onSuccessRepositoryModified
	^ self onSuccessAnnounce: [ IceRepositoryModified for: self repository ]