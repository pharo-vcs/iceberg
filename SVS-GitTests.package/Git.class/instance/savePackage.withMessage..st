actions
savePackage: packageName withMessage: commitMessage
	"Mostly copied from MCFileRepositoryInspector>>#saveChanges"
	| workingCopy | 
	workingCopy := MCWorkingCopy forPackage: (MCPackage named: packageName).
	(workingCopy newVersionWithMessage: commitMessage in: self repository) 
		ifNotNil: [:version | self repository storeVersion: version. ]