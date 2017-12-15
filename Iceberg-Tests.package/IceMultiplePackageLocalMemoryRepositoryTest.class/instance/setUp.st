running
setUp
	super setUp.
	packageName1 := 'IceMockPackage'.
	packageName2 := 'IceOtherMockPackage'.
	
	repository := IceMemoryRepository new.
	repository checkout.
	repository workingCopy addPackageNamed: packageName1.
	repository workingCopy addPackageNamed: packageName2.
	repository commitWithMessage: 'Initial commit'.