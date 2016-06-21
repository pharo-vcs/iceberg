actions
pull
	self command: 'pull'.
	self loadedPackages do: [ :package | self loadPackageNamed: package packageName ].
	self refresh
