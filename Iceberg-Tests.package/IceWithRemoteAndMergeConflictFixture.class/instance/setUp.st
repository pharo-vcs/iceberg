running
setUp
	super setUp.

	repository workingCopy addPackageNamed: self packageName1.
	repository commitWithMessage: 'Local commit'.