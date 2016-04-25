actions
updatePackage: packageName 
	self command: 'pull'.
	self loadPackage: packageName.