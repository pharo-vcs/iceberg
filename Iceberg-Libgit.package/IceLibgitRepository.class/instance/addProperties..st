accessing
addProperties: aRepositoryProperties
	aRepositoryProperties storeOn: self.
	index addPath: ((aRepositoryProperties 
		fileFor: self) 
		relativeTo: self location)