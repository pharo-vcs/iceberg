initialization
initializeFor: aRepositoryModel
	self model: (self createModelFor: aRepositoryModel).
	self initialize