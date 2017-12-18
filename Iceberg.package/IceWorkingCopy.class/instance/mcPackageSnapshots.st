private-monticello
mcPackageSnapshots
	
	^ self packages collect: [ :mcPackage | 
		mcPackage snapshot ]