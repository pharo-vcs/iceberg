testing
isAbstract
	^ super isAbstract
		or: [ self = IceProviderRepositoryType ]