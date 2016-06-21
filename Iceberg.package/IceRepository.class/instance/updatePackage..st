actions
updatePackage: packageName 
	self command: 'pull'.
	self loadPackageNamed: packageName.
	self refresh.
