private
internalSavePackage: aPackage withMessage: commitMessage

	"Save a package to the underlying store but do not commit"
	| newVersion |
	newVersion := workingCopy createNewMCVersionForPackageNamed: aPackage name withMessage: commitMessage.
	self internalStoreVersion: newVersion.
	^ newVersion