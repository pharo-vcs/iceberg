actions
pull
	self command: 'pull'.
	self loadedPackages do: [ :package | self loadPackage: package packageName ]