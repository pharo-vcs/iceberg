actions
savePackage: packageName withMessage: commitMessage
	"Mostly copied from MCFileRepositoryInspector>>#saveChanges"
	| workingCopy newVersion newVersionInfo |
	workingCopy := 	Iceberg workingCopyForPackageNamed: packageName.
	newVersionInfo := nil.
	newVersion := workingCopy 
		newVersionWithName: (self packageNamed: packageName) latestVersion nextVersionName
		message: commitMessage 
		in: self repository. 
	self repository storeVersion: newVersion.

	self refresh.
	
	"Replace working copy version info with the info created by our backend."
	workingCopy versionInfo: (self packageNamed: packageName) versions first info.
	
	self announcer announce: IceCommited new.
	