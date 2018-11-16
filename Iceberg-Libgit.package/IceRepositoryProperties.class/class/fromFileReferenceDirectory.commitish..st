instance creation
fromFileReferenceDirectory: aDirectory commitish: aCommitish

	^ self fromFileReference: aDirectory / self propertiesFileName  commitish: aCommitish