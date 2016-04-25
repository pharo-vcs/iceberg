actions
savePackage: packageName
	"Mostly copied from MCFileRepositoryInspector>>#saveChanges"
	| workingCopy | 
	workingCopy := MCWorkingCopy forPackage: (MCPackage new name: packageName).
	(workingCopy newVersionIn: self repository) 
		ifNotNil: [:version | self repository storeVersion: version. ]