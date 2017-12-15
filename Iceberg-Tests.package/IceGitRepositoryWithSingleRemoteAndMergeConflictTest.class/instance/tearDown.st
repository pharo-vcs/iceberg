running
tearDown

	(RPackageOrganizer default includesPackageNamed: packageName)
		ifTrue: [ packageName asPackage mcWorkingCopy unload ].
		
	(self location / projectName)
		ensureDeleteAll.
	remoteFileUrl asFileReference ensureDeleteAll.
	super tearDown.