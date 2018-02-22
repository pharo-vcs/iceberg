initialization
initializeFor: aRepositoryModel
	self model: (IceTipPackagesModel for: aRepositoryModel).
	self initialize