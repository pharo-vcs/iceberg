running
setUp
	| commit1 |
	super setUp.

	packageName1 := 'IceMockPackage1'.
	packageName2 := 'IceMockPackage2'.
	repository := IceMemoryRepository new.
	repository workingCopy: (IceRingWorkingCopy repository: repository).
	
	repository workingCopy addPackageNamed: packageName1.
	commit1 := repository commitWithMessage: 'Local commit'.
	
	repository workingCopy addPackageNamed: packageName2.
	repository commitWithMessage: 'Local commit 2'.
	
	repository checkout.
	
	(repository packageNamed: packageName1)
		currentCommit: commit1