initialization
initialElements
	^ self repository workingCopy loadedPackages
		collect: [ :package | | icepackage |
			icepackage := IceSavedPackage 
				named: package name
				repository: self repository.
			self createChangeSetFor: icepackage ]