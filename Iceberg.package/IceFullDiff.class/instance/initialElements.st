initialization
initialElements
	^ self repository workingCopy packages
		collect: [ :package | | icepackage |
			icepackage := IceSavedPackage 
				named: package name
				repository: self repository.
			self createChangeSetFor: icepackage ]