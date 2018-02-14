initialization
initialElements
	^ self repository workingCopy loadedPackages
		collect: [ :package | | icepackage |
			icepackage := IcePackage 
				named: package name
				repository: self repository.
			self createChangeSetFor: icepackage ]