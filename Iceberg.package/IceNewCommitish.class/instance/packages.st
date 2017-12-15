packages
packages
	
	^ self packageNames collect: [ :name | 
		IceSavedPackage named: name repository: self repository ]