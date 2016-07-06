actions
pull
	self repository command: 'pull'.
	self loadedPackages do: #loadLatest.
	self refresh
