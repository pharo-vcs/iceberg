actions
addPackage: aWorkingCopy
	^ self savedPackagesDictionary
		at: aWorkingCopy packageName
		ifAbsentPut: [ 
			self backend internalStoreVersion: aWorkingCopy loadedVersion.
			aWorkingCopy modified: true. "It will need to be commited, mark as dirty"
			IceSavedPackage 
				named: aWorkingCopy packageName 
				repository: self ]