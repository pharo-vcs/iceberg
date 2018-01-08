running
tearDown
	super tearDown.
	(RPackage organizer includesPackageNamed: packageName)
		ifTrue: [ packageName asPackage mcWorkingCopy unload ].
	Smalltalk globals at: #ForExtensionMethods ifPresent: #removeFromSystem