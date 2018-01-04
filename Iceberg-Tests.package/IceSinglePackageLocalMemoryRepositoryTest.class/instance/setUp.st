running
setUp
	super setUp.

	packageName := 'IceMockPackage'.	
	repository := IceMemoryRepository new.
	repository workingCopy: (IceRingWorkingCopy repository: repository).
	repository checkout.
	repository workingCopy addPackageNamed: packageName.
	repository commitWithMessage: 'Initial commit'.