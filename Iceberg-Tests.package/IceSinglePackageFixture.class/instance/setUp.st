running
setUp

	super setUp.
	repository workingCopy addPackageNamed: packageName1.
	repository commitWithMessage: 'Initial commit'.