running
setUp
	super setUp.

	packageName1 := 'IceMockPackage1'.
	packageName2 := 'IceMockPackage2'.
	repository := IceMemoryRepository new.
	repository workingCopy: (IceRingWorkingCopy repository: repository).
	repository workingCopy addPackageNamed: packageName1.
	repository workingCopy addPackageNamed: packageName2.
	repository commitWithMessage: 'Local commit'.
	repository checkout.