running
setUp
	super setUp.

	packageName := 'IceMockPackage'.	
	repository := IceMemoryRepository new.
	repository checkout.
	repository workingCopy addPackageNamed: packageName.
	repository commitWithMessage: 'Initial commit'.