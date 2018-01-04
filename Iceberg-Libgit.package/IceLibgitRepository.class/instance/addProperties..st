accessing
addProperties: aRepositoryProperties
	aRepositoryProperties storeOn: self.
	self addFilesToIndex: { ((aRepositoryProperties 
		fileFor: self) 
		relativeTo: self location)
		fullName }