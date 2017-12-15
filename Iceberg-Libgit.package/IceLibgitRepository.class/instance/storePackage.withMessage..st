accessing
storePackage: aPackage withMessage: commitMessage
	"Save a package to the underlying store but do not commit"
	| workingCopy newVersion |
	
	workingCopy := 	aPackage workingCopy.

	"This hack is copied from MCWorkingCopy code, I do not know why it is necessary."
	workingCopy modified: true; modified: false.
	
	(workingCopy repositoryGroup includes: self) 
		ifFalse: [ workingCopy repositoryGroup addRepository: self ].

	newVersion := MCVersion new
		setPackage: workingCopy package
		info: (IceMCVersionInfo package: aPackage message: commitMessage)
		snapshot: workingCopy package snapshot
		dependencies: #(). "Note we do not track Monticello dependencies."

	self internalStoreVersion: newVersion.

	SystemAnnouncer uniqueInstance
		announce: (MCVersionSaved version: newVersion repository: self).
	
	^ newVersion 