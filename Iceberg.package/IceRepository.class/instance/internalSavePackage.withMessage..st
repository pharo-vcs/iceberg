private
internalSavePackage: package withMessage: commitMessage
	"Save a package to the underlying store but do not commit"
	
	^ self subclassResponsibility