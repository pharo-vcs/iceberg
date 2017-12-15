running
tearDown

	(RPackageOrganizer default includesPackageNamed: packageName)
		ifTrue: [ packageName asPackage mcWorkingCopy unload ].
	super tearDown.