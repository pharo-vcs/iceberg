running
tearDown

	(RPackageOrganizer default includesPackageNamed: packageName1)
		ifTrue: [ packageName1 asPackage mcWorkingCopy unload ].
	(RPackageOrganizer default includesPackageNamed: packageName2)
		ifTrue: [ packageName2 asPackage mcWorkingCopy unload ].
	super tearDown.