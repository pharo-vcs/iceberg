private-monticello
createNewMCVersionForPackageNamed: aName withMessage: aMessage

	| mcPackage mcWorkingCopy |
	mcPackage := MCPackage named: aName.
	mcWorkingCopy := mcPackage workingCopy.

	"This hack is copied from MCWorkingCopy code, I do not know why it is necessary."
	mcWorkingCopy modified: true; modified: false.
	
	(mcWorkingCopy repositoryGroup includes: repository) 
		ifFalse: [ mcWorkingCopy repositoryGroup addRepository: repository ].

	^ MCVersion new
		setPackage: mcPackage
		info: (IceMCVersionInfo
			package: (IceSavedPackage named: aName repository: repository)
			message: aMessage)
		snapshot: mcPackage snapshot
		dependencies: #().