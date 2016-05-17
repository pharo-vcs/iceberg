actions
savePackage: packageName withMessage: commitMessage
	"Mostly copied from MCFileRepositoryInspector>>#saveChanges"
	| workingCopy newVersion |
	workingCopy := 	Ice workingCopyForPackageNamed: packageName.
	newVersion := workingCopy newVersionWithMessage: commitMessage in: self repository. 
	self repository storeVersion: newVersion.