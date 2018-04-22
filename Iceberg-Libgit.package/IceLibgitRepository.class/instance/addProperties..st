accessing
addProperties: aRepositoryProperties
	aRepositoryProperties storeOn: self.
	index addPath: ((aRepositoryProperties propertiesFileReferenceInRepository: self)
		relativeTo: self location)