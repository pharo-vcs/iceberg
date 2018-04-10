running
setUp
	super setUp.

	packageName := 'IceMockPackage'.	
	repository := IceMemoryRepository new.
	repository workingCopy: (IceRingWorkingCopy repository: repository).
	repository checkoutAllPackages.
	repository workingCopy addPackageNamed: packageName.
	repository commitWithMessage: 'Initial commit'.