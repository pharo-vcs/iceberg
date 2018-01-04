actions
createNewMCVersionForPackageNamed: aName withMessage: aMessage

	| mcPackage mcSnapshot |
	mcPackage := MCPackage named: aName.
	mcSnapshot := (ringEnvironment ensurePackageNamed: aName) asMCSnapshot.
	^ MCVersion new
		setPackage: mcPackage
		info: (IceMCVersionInfo
			package: (IceSavedPackage named: aName repository: repository)
			message: aMessage)
		snapshot: mcSnapshot
		dependencies: #().