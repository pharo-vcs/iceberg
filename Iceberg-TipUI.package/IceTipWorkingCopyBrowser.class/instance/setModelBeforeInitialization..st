initialization
setModelBeforeInitialization: aRepositoryModel
	self model: (IceTipWorkingCopyModel on: aRepositoryModel)