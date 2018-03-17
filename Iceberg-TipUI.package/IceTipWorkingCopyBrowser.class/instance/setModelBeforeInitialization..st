initialization
setModelBeforeInitialization: aRepositoryModel
	self model: (IceTipPackagesModel on: aRepositoryModel)