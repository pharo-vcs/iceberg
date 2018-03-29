running
setUp
	super setUp.
	packageName1 := 'IceMockPackage'.
	packageName2 := 'IceOtherMockPackage'.
	
	repository := IceMemoryRepository new.
	repository workingCopy: (IceRingWorkingCopy repository: repository).
	
	repository checkoutAllPackages.
	repository workingCopy addPackageNamed: packageName1.
	repository workingCopy addPackageNamed: packageName2.
	repository commitWithMessage: 'Initial commit'.