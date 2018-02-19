building
ensurePackageFromDirectoryName: aString 
	
	^ self ensurePackageFromPackage: (IcePackage named: (diff packageNameFromDirectoryName: aString) repository: diff repository)