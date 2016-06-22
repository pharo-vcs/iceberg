actions
updatePackage: packageName 
	self command: 'pull'.
	(self packageNamed: packageName) loadLatest.
	self refresh.
