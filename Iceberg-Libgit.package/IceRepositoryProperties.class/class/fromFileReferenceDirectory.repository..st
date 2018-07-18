instance creation
fromFileReferenceDirectory: aDirectory repository: aRepository

	^ self fromFileReference: aDirectory / self propertiesFileName  repository: aRepository